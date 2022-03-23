import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart';
import 'package:discord_replicate/data/store/server_store/hivedb_server_store.dart';
import 'package:discord_replicate/data/store/server_store/inmemory_server_store.dart';
import 'package:discord_replicate/data/repository/server_repository_impl.dart';

import 'package:discord_replicate/domain/model/credential.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';

import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthRepository {}

class MockDb extends Mock implements HiveServerStore {}

class MockServerCache extends Mock implements InMemoryServerStore {}

class MockServer extends Mock implements Server {}

main() {
  group("Server Repository Remote Source", () {
    var mockDb = MockDb();
    var mockCache = MockServerCache();
    var mockAuthService = MockAuthService();

    var client = GraphQLClientHelper(
      url: "http://localhost:4000/graphql",
      wsUrl: "ws://localhost:4000/graphql",
      bearerProvider: () async => "",
      defaultHeader: {
        "allow-me-in": "artahc123",
      },
    );
    var serverApi = GraphQLServerRemoteApiImpl(client: client);
    var serverRepo = ServerRepositoryImpl(_api: serverApi, database: mockDb, _cache: mockCache);

    setUpAll(() {
      when(() => mockAuthService.getCredential(forceRefresh: any(named: "forceRefresh")))
          .thenAnswer((invocation) => Future.value(Credential(email: "", token: "", uid: "")));

      registerFallbackValue(MockServer());
    });
    tearDown(() {
      reset(mockDb);
      reset(mockCache);
    });

    test("Load server from remote API, should be able parse result to Server model.", () async {
      var serverId = "JkBxr0EoQOYyDeXagC2h";

      when(() => mockDb.save(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.save(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.load(any())).thenAnswer((invocation) => Future.value(null));

      var server = await serverRepo.getServerById(serverId);

      verify(() => mockDb.load(any())).called(1);
      verify(() => mockDb.save(any())).called(1);

      verify(() => mockCache.save(any())).called(1);
      verify(() => mockCache.load(any())).called(1);

      expect(server, isA<Server>());
    });
  });
}
