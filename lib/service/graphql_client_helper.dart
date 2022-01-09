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

    _link = _authLink.concat(_httpLink);
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

    log("Request => ${query.trim()}", name: this.runtimeType.toString());

    if (result.hasException) {
      return Future.error(mapException(result.exception!));
    } else {
      log("Response <= $result", name: this.runtimeType.toString());
      return result.data!;
    }
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
      var e = gqlErrors.first;
      String errorCode = e.extensions!['code'];
      switch (errorCode) {
        case 'NOT_FOUND_ERROR':
          return NotFoundException(e.message, source: e);
        case 'INTERNAL_SERVER_ERROR':
          return Exception("Unhandled Error");
      }
    }

    return e;
  }
}
