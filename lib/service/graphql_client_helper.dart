import 'dart:async';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';

class GraphQLClientHelper with ExceptionMapperMixin {
  late GraphQLClient _client;
  late AuthService _authService;
  late Logger log = Logger();

  GraphQLClientHelper(
    String url, {
    AuthService? authService,
    GraphQLCache? cache,
    Map<String, String>? defaultHeader,
  }) : _authService = authService ?? GetIt.I.get<AuthService>() {
    var httpLink = HttpLink(url, defaultHeaders: defaultHeader ?? {});
    var authLink = AuthLink(getToken: () async {
      var credential = await _authService.getCredential(forceRefresh: true);
      var token = credential == null ? "" : credential.token;
      var bearer = 'Bearer $token';
      return bearer;
    });
    var wsLink = WebSocketLink("ws://localhost:4000/graphql");

    var link = authLink.concat(httpLink);
    link = Link.split((request) => request.isSubscription, wsLink, link);

    _client = GraphQLClient(
      link: link,
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

    log.d("Query => ${query.trim()} \nVariables: $variables");
    if (result.hasException) {
      return Future.error(mapException(result.exception!));
    } else {
      log.i("Response <= $result");
      return result.data!;
    }
  }

  Future<Map<String, dynamic>> mutate(String mutation, {Map<String, dynamic> variables = const {}}) async {
    var options = MutationOptions(document: gql(mutation), variables: variables);
    var result = await _client.mutate(options);

    log.i("Mutation => ${mutation.trim()} \nVariables: $variables");

    if (result.hasException) {
      return Future.error(mapException(result.exception!));
    } else {
      log.i("Response <= $result");
      return result.data!;
    }
  }

  Stream<Map<String, dynamic>> subscribe(String subscription, {Map<String, dynamic> variables = const {}}) async* {
    var options = SubscriptionOptions(document: gql(subscription), variables: variables);
    var stream = _client.subscribe(options);

    log.i("Subscription => ${subscription.trim()} \nVariables: $variables");

    yield* stream.map((result) {
      if (result.hasException) {
        throw mapException(result.exception!);
      } else {
        log.i("Response <= ${result.data}");
        return result.data!;
      }
    });
  }

  Exception mapException(Exception e) {
    var operationException = e as OperationException;
    var linkError = operationException.linkException;
    var gqlErrors = operationException.graphqlErrors;

    if (linkError != null) {
      log.e("Link error $linkError", linkError, StackTrace.current);
      return linkError;
    }
    if (gqlErrors.isNotEmpty) {
      var graphqlError = gqlErrors.first;
      log.e("GraphQL error $gqlErrors", graphqlError, StackTrace.current);
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
