import 'package:custom_extension/custom_extensions.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Store<String, UserGroup> store;

  setUpAll(() {
    store = InMemoryUserGroupStore();
  });

  setUp(() async {
    await store.clear();
  });

  test("""
  Given a empty store,
  When save is called,
  Then verify values is saved to cache.
  """, () async {
    // arrange
    var foo = const Member(uid: "member-1", name: "member-1");
    var bar = const Member(uid: "member-2", name: "member-2");
    var userGroup = UserGroup.fromMembers(id: "id-1", members: [foo, bar]);
    expect(await store.load(userGroup.id), null);

    // execute
    await store.save(userGroup.id, userGroup);

    // assert
    var loaded = await store.load(userGroup.id);

    expect(loaded, isNotNull);
    expect(loaded!.members.values, containsAll([foo, bar]));
    expect(loaded.members.keys, containsAll([foo, bar].map((e) => e.uid)));
  });

  test(
      """
  Given an existing userGroup in in-memory store,
  When save is called,
  Then verify cache should be merged instead of replaced, same entries should be overwritten.
  """,
      () async {
    // arrange

    var foo = const Member(uid: "member-1", name: "member-1");
    var bar = const Member(uid: "member-2", name: "member-2");
    var baz = const Member(uid: "member-3", name: "member-3");

    var initialUserGroup = UserGroup.fromMembers(id: "id-1", members: [foo, bar]);

    expect(await store.load(initialUserGroup.id), null);
    await store.save(initialUserGroup.id, initialUserGroup);

    var storedUserGroup = await store.load(initialUserGroup.id);
    expect(storedUserGroup, isNotNull);
    expect(storedUserGroup!.members.values, containsAll([foo, bar]));
    expect(storedUserGroup.members.keys, containsAll([foo, bar].map((e) => e.uid)));

    // execute
    var updatedBar = bar.copyWith(name: "update-member-2");
    var newUserGroup = UserGroup.fromMembers(id: "id-1", members: [
      updatedBar,
      baz,
    ]);

    await store.save(newUserGroup.id, newUserGroup);

    // assert
    var loadedUserGroup = await store.load(initialUserGroup.id);

    expect(loadedUserGroup, isNotNull);
    expect(loadedUserGroup!.members.values, containsAll([foo, updatedBar, baz]));
    expect(loadedUserGroup.members.keys, containsAll([foo, updatedBar, baz].map((e) => e.uid)));
  });

  test(
      """
  Given an existing user group in store,
  When saveAll called with updated user group (A) and new user group (B)
  Then verify user group (A)'s member is merged, and new user group is saved.
  """,
      () async {
    // arrange
    var foo = const Member(uid: "member-1", name: "member-1");
    var bar = const Member(uid: "member-2", name: "member-2");
    var baz = const Member(uid: "member-3", name: "member-3");

    var initialUserGroup = UserGroup.fromMembers(id: "a", members: [foo, bar]);
    expect(store.load(initialUserGroup.id), isNull);

    await store.save(initialUserGroup.id, initialUserGroup);

    var storedUserGroup = await store.load(initialUserGroup.id);
    expect(storedUserGroup, isNotNull);
    expect(storedUserGroup!.members.values, containsAll([foo, bar]));
    expect(storedUserGroup.members.keys, containsAll([foo, bar].map((e) => e.uid)));

    // execute
    var updatedBar = bar.copyWith(name: "updated-member-2");
    var updatedUserGroup = UserGroup.fromMembers(id: "a", members: [updatedBar, baz]);

    var qux = const Member(uid: "member-4", name: "member-4");
    var newUserGroup = UserGroup.fromMembers(id: "b", members: [qux]);

    await store.saveAll([updatedUserGroup, newUserGroup].toMap(keyConverter: (e) => e.id, valueConverter: (e) => e));

    // assert
    var newUserGroupLoaded = await store.load(newUserGroup.id);
    expect(newUserGroupLoaded, isNotNull);
    expect(newUserGroup.members.values, containsAll([qux]));
    expect(newUserGroup.members.keys, containsAll([qux].map((e) => e.uid)));

    var updatedUserGroupLoaded = await store.load(updatedUserGroup.id);
    expect(updatedUserGroupLoaded, isNotNull);
    expect(updatedUserGroupLoaded!.members.length, 3);
    expect(updatedUserGroupLoaded.members.values, containsAll([foo, updatedBar, baz]));
    expect(updatedUserGroupLoaded.members.keys, containsAll([foo, updatedBar, baz].map((e) => e.uid)));
  });
}
