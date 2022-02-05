import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/credential/credential.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/model/user_group/user_group.dart';
import 'package:discord_replicate/repository/repository.dart';
import 'package:discord_replicate/repository/user_repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

class MockDb extends Mock implements HiveDatabaseService {}

class MockAuthService extends Mock implements AuthService {}

main() {
  var mockDb = MockDb();
  var mockAuthService = MockAuthService();
  var api = GraphQLClientHelper(
    "http://localhost:4000/graphql",
    "ws://localhost:4000/graphql",
    authService: mockAuthService,
    defaultHeader: {
      "allow-me-in": "artahc123",
    },
  );

  group("Remote Source", () {
    setUpAll(() {
      when(() => mockAuthService.getCredential(forceRefresh: any(named: "forceRefresh")))
          .thenAnswer((invocation) => Future.value(Credential(email: "", token: "", uid: "")));
    });
    tearDown(() {
      reset(mockDb);
    });

    test("Load server from remote API, should be able parse result to Server model.", () async {
      var serverRepo = ServerRepository(apiClient: api, database: mockDb);

      when(() => mockDb.save(any(), any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.load<Server>(any())).thenAnswer((invocation) => Future.value(null));

      var server = await serverRepo.load("JkBxr0EoQOYyDeXagC2h");

      verify(() => mockDb.load<Server>(any())).called(1);
      verify(() => mockDb.save(any(), any())).called(1);
      expect(server, isA<Server>());
    });

    test('Load user from remote API, should be able to parse result to Server model.', () async {
      var userRepo = UserRepository(apiClient: api, database: mockDb);

      when(() => mockDb.save(any(), any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.load<User?>(any())).thenAnswer((invocation) => Future.value(null));

      var user = await userRepo.load("FMYbWPwFWgTvRemhbbz1dLL9HkC2");

      expect(user, isA<User>());
    });

    test('Load channel from remote API, should be able to parse result to Channel model.', () async {
      var channelRepo = ChannelRepositoryImpl(apiClient: api, database: mockDb);

      when(() => mockDb.save(any(), any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.load<Channel?>(any())).thenAnswer((invocation) => Future.value(null));

      var channel = await channelRepo.load("65l2SQFgkqYRXXJyRfWT");

      expect(channel, isA<Channel>());
    });

    test('Load user group from remote API, should be able to parse result to UserGroup model', () async {
      var userGroupRepo = UserGroupRepositoryImpl(client: api, database: mockDb);

      when(() => mockDb.save(any(), any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.load<UserGroup?>(any())).thenAnswer((invocation) => Future.value(null));

      var userGroup = await userGroupRepo.load('Xs6WqQiH2JuwPJrAZvB9');

      expect(userGroup, isA<UserGroup>());
    });

    test('Load user group from remote API, should be able to parse result to UserGroup model', () async {
      var userGroupRepo = UserGroupRepositoryImpl(client: api, database: mockDb);

      when(() => mockDb.save(any(), any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.load<UserGroup?>(any())).thenAnswer((invocation) => Future.value(null));

      var userGroup = await userGroupRepo.load('Xs6WqQiH2JuwPJrAZvB9');
      print("$userGroup");
      expect(userGroup, isA<UserGroup>());
    });
  });
}
