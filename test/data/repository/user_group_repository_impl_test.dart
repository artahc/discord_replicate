import 'package:discord_replicate/application/config/hive.config.dart';
import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/repository/user_group_repository_impl.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart';
import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final container = GetIt.asNewInstance();

  // Dependency
  late UserGroupRemoteApi api;
  late Store<String, UserGroup> db;
  late Store<String, UserGroup> cache;

  // Object under test.
  late UserGroupRepository repo;

  group("getMemberById with Remote API source", () {
    setUpAll(() async {
      await initHive();
      configureDependencies(container, Env.TEST);

      api = container.get();
      db = HiveUserGroupStore();
      cache = InMemoryUserGroupStore();

      repo = UserGroupRepositoryImpl(api, db, cache);
    });

    setUp(() async {
      await db.clear();
      await cache.clear();
    });

    test("""
    Given a user group repository impl. Cache and DB is empty.
    When getMemberById called,
    Then should return instance of Member.
    """, () async {
      // arrange
      var foo = const Member(uid: "foo", name: "foo");
      var bar = const Member(uid: "bar", name: "bar");

      when(() => api.getUserGroupById("ug-1", 30, null))
          .thenAnswer((invocation) async => PaginationResponse(items: [foo, bar], hasMore: true));

      // execute
      var member = await repo.getMemberById("ug-1", "foo");

      // assert
      expect(
        member,
        allOf([
          isA<Member>(),
          equals(foo),
        ]),
      );
      verify(() => api.getUserGroupById("ug-1", 30, null)).called(1);
    });

    test("""
    Given a user group repository with cached data in DB,
    When getMemberById called,
    Then verify remote API is not called. 
    """, () async {
      // arrange
      var foo = const Member(uid: "1", name: "foo");
      var bar = const Member(uid: "2", name: "bar");

      var initialUserGroup = UserGroup.fromMembers(id: "ug-1", members: [foo, bar]);
      await db.save(initialUserGroup.id, initialUserGroup);

      when(() => api.getUserGroupById(initialUserGroup.id, any(), any()))
          .thenAnswer((invocation) async => PaginationResponse(items: initialUserGroup.members.values, hasMore: true));
      // execute
      var member = await repo.getMemberById(initialUserGroup.id, foo.uid);

      // assert
      expect(
        member,
        allOf([
          isA<Member>(),
          equals(foo),
        ]),
      );
      verifyNever(() => api.getUserGroupById(initialUserGroup.id, any(), any()));
    });
  });
}
