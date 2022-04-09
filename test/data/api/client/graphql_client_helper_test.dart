import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/query/get_channel_query_operation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final container = GetIt.asNewInstance();
  configureDependencies(container, Env.TEST);

  // dependencies
  final GraphQLClientHelper mockClient = container.get();

  test("""
  Given 2 identical GraphQL operation,
  When both are compared,
  Then result must be true
  """, () async {
    var q1 = GetChannelQuery(id: "someId", memberLimit: 15);
    var q2 = GetChannelQuery(id: "someId", memberLimit: 15);

    assert(q1 == q2);
  });

  test("""
  Given a mock graphql client,
  When query executed,
  Then return mocked data 
  """, () async {
    var operation = GetChannelQuery(id: "id", memberLimit: 15);
    var expectedData = {"data": "someData"};
    when(() => mockClient.query(operation)).thenAnswer((invocation) => Future.value(expectedData));

    expect(mockClient.query(operation), completion(expectedData));
    verify(() => mockClient.query(operation)).called(1);
  });
}
