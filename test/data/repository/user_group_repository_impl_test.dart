import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/repository/user_group_repository_impl.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final container = GetIt.asNewInstance();

  // Dependency
  late UserGroupRemoteApi api;
  late Store<String, UserGroup> mockDb;
  late Store<String, UserGroup> mockCache;

  // Object under test.
  late UserGroupRepository userGroupRepo;

  setUpAll(() async {
    configureDependencies(container, Env.TEST);

    api = container.get();
    mockDb = container.get(instanceName: "DB_USERGROUP");
    mockCache = container.get(instanceName: "CACHE_USERGROUP");

    userGroupRepo = UserGroupRepositoryImpl(api, mockDb, mockCache);
  });

  group("Remote Source", () {
    test("Load user group from remote source, should be able to parse to UserGroup model.", () async {
      var userGroupId = "Xs6WqQiH2JuwPJrAZvB9";
      var expectedResult = UserGroup(id: "Xs6WqQiH2JuwPJrAZvB9", members: {});

      // when(() => api.getUserGroupById(userGroupId, 30, null)).thenAnswer((invocation) => Future.value(expectedResult));
      when(() => mockDb.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.save(any(), any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.save(any(), any())).thenAnswer((invocation) => Future.value(null));

      // var user = await userRepo.getUserGroup(userGroupId);

      verify(() => mockDb.load(any())).called(1);
      verify(() => mockDb.save(any(), any())).called(1);
      verify(() => mockCache.load(any())).called(1);
      verify(() => mockCache.save(any(), any())).called(1);

      // expect(user, isA<UserGroup>());
    });
  });
}
