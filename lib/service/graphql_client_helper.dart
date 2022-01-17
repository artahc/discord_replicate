import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/model/credential.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientHelper with ExceptionMapperMixin {
  late GraphQLClient _client;
  late HttpLink _httpLink;
  late AuthLink _authLink;
  late WebSocketLink _wsLink;

  late Link _link;

  late Future<Credential?> Function() tokenProvider;

  GraphQLClientHelper({required String url, required this.tokenProvider, GraphQLCache? cache, Map<String, String>? defaultHeader}) {
    _httpLink = HttpLink(url, defaultHeaders: defaultHeader ?? {});
    _authLink = AuthLink(getToken: () async {
      var credential = await tokenProvider.call();
      var token = credential == null ? "" : credential.token;
      var bearer = 'Bearer $token';
      return bearer;
    });
    _wsLink = WebSocketLink("ws://localhost:4000/graphql");

    _link = _authLink.concat(_httpLink);
    _link = Link.split((request) => request.isSubscription, _wsLink, _link);

    _client = GraphQLClient(
      link: _link,
      cache: cache ?? GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.noCache,
          cacheReread: CacheRereadPolicy.ignoreAll,
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> query(String query, {Map<String, dynamic> variables = const {}}) async {
    var options = QueryOptions(document: gql(query), variables: variables);
    var result = await _client.query(options);

    log("Query => ${query.trim()}", name: this.runtimeType.toString());

    if (result.hasException) {
      return Future.error(mapException(result.exception!));
    } else {
      log("Response <= $result", name: this.runtimeType.toString());
      return result.data!;
    }
  }

  Future<Map<String, dynamic>> mutate(String mutation, {Map<String, dynamic> variables = const {}}) async {
    var options = MutationOptions(document: gql(mutation), variables: variables);
    var result = await _client.mutate(options);

    log("Mutation => ${mutation.trim()}", name: this.runtimeType.toString());

    if (result.hasException) {
      return Future.error(mapException(result.exception!));
    } else {
      log("Response <= $result", name: this.runtimeType.toString());
      return result.data!;
    }
  }

  Stream<Map<String, dynamic>> subscribe(String subscription, {Map<String, dynamic> variables = const {}}) async* {
    var options = SubscriptionOptions(document: gql(subscription), variables: variables);
    var stream = _client.subscribe(options);

    log("Subscription => ${subscription.trim()}", name: this.runtimeType.toString());

    yield* stream.map((result) {
      if (result.hasException) {
        throw mapException(result.exception!);
      } else {
        log("Response <= ${result.data}", name: this.runtimeType.toString());
        return result.data!;
      }
    });
  }

  Exception mapException(Exception e) {
    var operationException = e as OperationException;
    var linkError = operationException.linkException;
    var gqlErrors = operationException.graphqlErrors;

    log("Response containing errors", name: this.runtimeType.toString());

    if (linkError != null) {
      log("Link error $linkError", name: this.runtimeType.toString());
      return linkError;
    }
    if (gqlErrors.isNotEmpty) {
      log("GraphQL error $gqlErrors", name: this.runtimeType.toString());
      var graphqlError = gqlErrors.first;
      String errorCode = graphqlError.extensions!['code'];
      switch (errorCode) {
        case 'NOT_FOUND_ERROR':
          return NotFoundException(graphqlError.message, source: graphqlError);
        case 'INTERNAL_SERVER_ERROR':
          return e;
      }
    }

    return e;
  }
}
