import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart';
import 'package:discord_replicate/data/store/user_store/hivedb_user_store.dart';
import 'package:discord_replicate/data/store/user_store/inmemory_user_store.dart';
import 'package:discord_replicate/data/repository/user_repository_impl.dart';
import 'package:discord_replicate/domain/model/credential.dart';

import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';

import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthRepository {}

class MockDb extends Mock implements HiveUserStore {}

class MockUserCache extends Mock implements InMemoryUserStore {}

class MockUser extends Mock implements User {}

void main() {
  group("Remote Source", () {
    var mockDb = MockDb();
    var mockCache = MockUserCache();
    var mockAuthService = MockAuthService();

     var client = GraphQLClientHelper(
      url: "http://localhost:4000/graphql",
      wsUrl: "ws://localhost:4000/graphql",
      bearerProvider: () async => "",
      defaultHeader: {
        "allow-me-in": "artahc123",
      },
    );
    var remoteApi = GraphQLUserRemoteApiImpl(client: client);

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

      var user = await userRepo.getUserById(userId);

      verify(() => mockDb.load(any())).called(1);
      verify(() => mockDb.save(any())).called(1);
      verify(() => mockCache.load(any())).called(1);
      verify(() => mockCache.save(any())).called(1);

      expect(user, isA<User>());
    });
  });
}
