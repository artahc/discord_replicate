import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart';
import 'package:discord_replicate/data/repository/user_repository_impl.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/api/user_remote_api.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/credential.dart';

import 'package:discord_replicate/domain/model/user.dart';

import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final container = GetIt.asNewInstance();

  // Dependency
  late GraphQLClientHelper client;
  late UserRemoteApi api;
  late Store<User> mockDb;
  late Store<User> mockCache;

  // Object under test.
  late UserRepository userRepo;

  setUpAll(() async {
    configureDependencies(container, Env.TEST);

    client = container.get();
    api = container.get();
    mockDb = container.get(instanceName: "DB_USER");
    mockCache = container.get(instanceName: "CACHE_USER");

    userRepo = UserRepositoryImpl(api, mockDb, mockCache);
  });

  test("Load user from remote source, should be able to parse to User model.", () async {
    var userId = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
    var expectedResult = User(
      uid: "uid",
      name: "name",
      avatarUrl: "avatarUrl",
      about: "about",
      privateChannels: [],
      servers: [],
    );

    when(() => api.getUserById(userId)).thenAnswer((invocation) => Future.value(expectedResult));
    when(() => mockDb.load(userId)).thenAnswer((invocation) => Future.value(null));
    when(() => mockDb.save(expectedResult)).thenAnswer((invocation) => Future.value(null));
    when(() => mockCache.load(userId)).thenAnswer((invocation) => Future.value(null));
    when(() => mockCache.save(expectedResult)).thenAnswer((invocation) => Future.value(null));

    var user = await userRepo.getUserById(userId);

    verify(() => mockDb.load(userId)).called(1);
    verify(() => mockDb.save(expectedResult)).called(1);
    verify(() => mockCache.load(userId)).called(1);
    verify(() => mockCache.save(expectedResult)).called(1);

    expect(user, isA<User>());
  });
}
