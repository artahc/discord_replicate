import 'package:discord_replicate/model/credential/credential.dart';
import 'package:discord_replicate/model/user_group/user_group.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/repository/user_group_repository/hivedb_usergroup_store.dart';
import 'package:discord_replicate/repository/user_group_repository/inmemory_usergroup_store.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthService {}

class MockDb extends Mock implements HiveUserGroupStore {}

class MockUserGroupCache extends Mock implements InMemoryUserGroupStore {}

class MockUserGroup extends Mock implements UserGroup {}

void main() {
  group("Remote Source", () {
    var mockDb = MockDb();
    var mockCache = MockUserGroupCache();
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

    var userRepo = UserGroupRepositoryImpl(api: remoteApi, database: mockDb, cache: mockCache);

    setUpAll(() {
      when(() => mockAuthService.getCredential(forceRefresh: any(named: "forceRefresh")))
          .thenAnswer((invocation) => Future.value(Credential(email: "", token: "", uid: "")));
      registerFallbackValue(MockUserGroup());
    });

    test("Load user group from remote source, should be able to parse to UserGroup model.", () async {
      var userGroupId = "Xs6WqQiH2JuwPJrAZvB9";

      when(() => mockDb.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.save(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.save(any())).thenAnswer((invocation) => Future.value(null));

      var user = await userRepo.getUserGroup(userGroupId);

      verify(() => mockDb.load(any())).called(1);
      verify(() => mockDb.save(any())).called(1);
      verify(() => mockCache.load(any())).called(1);
      verify(() => mockCache.save(any())).called(1);

      expect(user, isA<UserGroup>());
    });
  });
}
