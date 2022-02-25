import 'dart:async';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/external/app_log_filter.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

abstract class GraphQLOperation {
  String get operation;
  Map<String, dynamic> get variables;
}

class GraphQLClientHelper with ExceptionMapperMixin, Disposable {
  late GraphQLClient _client;
  late AuthService _authService;
  late Logger log = Logger(filter: DisableLogFilter());

  GraphQLClientHelper(
    String url,
    String wsUrl, {
    AuthService? authService,
    GraphQLCache? cache,
    Map<String, String>? defaultHeader,
  }) : _authService = authService ?? sl.get<AuthService>() {
    var httpLink = HttpLink(url, defaultHeaders: defaultHeader ?? {});
    var authLink = AuthLink(getToken: () async {
      var credential = await _authService.getCredential(forceRefresh: true);
      var token = credential == null ? "" : credential.token;
      var bearer = 'Bearer $token';
      return bearer;
    });
    var wsLink = WebSocketLink(wsUrl);

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

  Future<Map<String, dynamic>> query(GraphQLOperation operation) async {
    var options = QueryOptions(document: gql(operation.operation), variables: operation.variables);
    var result = await _client.query(options);

    log.i("Query => ${operation.operation.trim()} \nVariables: ${operation.variables}");
    if (result.hasException) {
      return Future.error(mapException(result.exception!));
    } else {
      log.i("Response <= $result");
      return result.data!;
    }
  }

  Future<Map<String, dynamic>> mutate(GraphQLOperation operation) async {
    var options = MutationOptions(document: gql(operation.operation), variables: operation.variables);
    var result = await _client.mutate(options);

    log.i("Mutation => ${operation.operation.trim()} \nVariables: ${operation.variables}");

    if (result.hasException) {
      return Future.error(mapException(result.exception!));
    } else {
      log.i("Response <= $result");
      return result.data!;
    }
  }

  Stream<Map<String, dynamic>> subscribe(GraphQLOperation operation) async* {
    var options = SubscriptionOptions(document: gql(operation.operation), variables: operation.variables);
    var stream = _client.subscribe(options);

    log.i("Subscription => ${operation.operation.trim()} \nVariables: ${operation.variables}");

    yield* stream.doOnData((data) {
      log.i("Received new data from subscription. $data");
    }).map((result) {
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

  @override
  FutureOr onDispose() {
    this._client.resetStore();
  }
}
