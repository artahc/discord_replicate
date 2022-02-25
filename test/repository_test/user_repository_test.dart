import 'package:discord_replicate/model/credential/credential.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/repository/user_repository/hivedb_user_store.dart';
import 'package:discord_replicate/repository/user_repository/inmemory_user_store.dart';
import 'package:discord_replicate/repository/user_repository/user_repository_impl.dart';
import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthService {}

class MockDb extends Mock implements HiveUserStore {}

class MockUserCache extends Mock implements InMemoryUserStore {}

class MockUser extends Mock implements User {}

void main() {
  group("Remote Source", () {
    var mockDb = MockDb();
    var mockCache = MockUserCache();
    var mockAuthService = MockAuthService();

    var client = GraphQLClientHelper(
      "http://localhost:4000/graphql",
      "ws://localhost:4000/graphql",
      authService: mockAuthService,
      defaultHeader: {
        "allow-me-in": "artahc123",
      },
    );
    var remoteApi = GraphQLApiImpl(client: client);

    var userRepo = UserRepositoryImpl(api: remoteApi, database: mockDb, cache: mockCache);

    setUpAll(() {
      when(() => mockAuthService.getCredential(forceRefresh: any(named: "forceRefresh")))
          .thenAnswer((invocation) => Future.value(Credential(email: "", token: "", uid: "")));
      registerFallbackValue(MockUser());
    });

    test("Load user from remote source, should be able to parse to User model.", () async {
      var userId = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";

      when(() => mockDb.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.save(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.save(any())).thenAnswer((invocation) => Future.value(null));

      var user = await userRepo.getUser(userId);

      verify(() => mockDb.load(any())).called(1);
      verify(() => mockDb.save(any())).called(1);
      verify(() => mockCache.load(any())).called(1);
      verify(() => mockCache.save(any())).called(1);

      expect(user, isA<User>());
    });
  });
}
