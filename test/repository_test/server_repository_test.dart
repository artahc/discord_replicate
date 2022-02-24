import 'package:discord_replicate/model/credential/credential.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/repository/server_repository/hivedb_server_store.dart';
import 'package:discord_replicate/repository/server_repository/inmemory_server_store.dart';
import 'package:discord_replicate/repository/server_repository/server_repository_impl.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/external/hive_constants.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

final Logger log = Logger();

class MockAuthService extends Mock implements AuthService {}

class MockDb extends Mock implements HiveServerStore {}

class MockServerCache extends Mock implements InMemoryServerStore {}

class MockServer extends Mock implements Server {}

main() {
  group("Server Repository Remote Source", () {
    var mockDb = MockDb();
    var mockCache = MockServerCache();
    var mockAuthService = MockAuthService();

    var client = GraphQLClientHelper(
      "http://localhost:4000/graphql",
      "ws://localhost:4000/graphql",
      authService: mockAuthService,
      defaultHeader: {
        "allow-me-in": "artahc123",
      },
    );
    var serverApi = RemoteApiImpl(client: client);
    var serverRepo = ServerRepositoryImpl(api: serverApi, database: mockDb, cache: mockCache);

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

      var server = await serverRepo.getServer(serverId);

      verify(() => mockDb.load(any())).called(1);
      verify(() => mockDb.save(any())).called(1);

      verify(() => mockCache.save(any())).called(1);
      verify(() => mockCache.load(any())).called(1);

      expect(server, isA<Server>());
    });
  });

  group("Server Repository Local Database Source", () {});
}
