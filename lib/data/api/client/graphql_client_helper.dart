import 'dart:async';

import 'package:custom_exception/custom_exception.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';

import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'graphql_operation/graphql_operation.dart';

@Singleton()
class GraphQLClientHelper with Disposable {
  final GraphQLClient _client;

  GraphQLClientHelper(this._client);

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
