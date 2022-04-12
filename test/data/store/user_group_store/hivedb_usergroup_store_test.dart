import 'package:custom_extension/custom_extensions.dart';
import 'package:discord_replicate/application/config/hive.config.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Store<String, UserGroup> store;

  setUpAll(() async {
    await initHive();
    store = HiveUserGroupStore();
  });

  setUp(() async {
    await store.clear();
  });

  test(
      """
  Given an existing user group in store,
  When load called, and then returned value modifed. 
  Then verify modified value doesnt affect value inside box.
  """,
      () async {
    // arrange
    var foo = const Member(uid: "1", name: "1");
    var bar = const Member(uid: "2", name: "2");
    var initialUserGroup = UserGroup.fromMembers(id: "id-1", members: [foo, bar]);

    await store.save(initialUserGroup.id, initialUserGroup);

    // execute
    var storedUserGroup = await store.load(initialUserGroup.id);
    expect(storedUserGroup, isNotNull);
    expect(storedUserGroup!.members.values, containsAll([foo, bar]));

    storedUserGroup.members.removeWhere((key, value) => key == foo.uid);

    // assert
    var loadedUserGroup = await store.load(initialUserGroup.id);
    expect(loadedUserGroup, isNotNull);
    expect(loadedUserGroup!.members.values, containsAll([foo, bar]));
  });

  test("""
  Given an empty hive box,
  When save called,
  Then verify box should contains stored values
  """,
      () async {
    // arrange
    var foo = const Member(uid: "1", name: "1");
    var bar = const Member(uid: "2", name: "2");
    var userGroup = UserGroup.fromMembers(id: "id-1", members: [foo, bar]);

    // execute
    await store.save(userGroup.id, userGroup);

    // assert
    var storedUserGroup = await store.load(userGroup.id);

    expect(storedUserGroup, isNotNull);
    expect(storedUserGroup!.members.values, containsAll([foo, bar]));
    expect(storedUserGroup.members.keys, containsAll([foo, bar].map((e) => e.uid)));
  });

  test(
      """
  Given a box with existing user group,
  When save called with updated user group,
  Then verify stored value should be merged and overwritten, instead of replaced.
  """,
      () async {
    // arrange
    var foo = const Member(uid: "1", name: "1");
    var bar = const Member(uid: "2", name: "2");
    var initialUserGroup = UserGroup.fromMembers(id: "id-1", members: [foo, bar]);

    await store.save(initialUserGroup.id, initialUserGroup);

    // execute
    var updatedBar = bar.copyWith(name: "updated-2");
    var baz = const Member(uid: "3", name: "3");
    var updatedUserGroup = UserGroup.fromMembers(id: "id-1", members: [updatedBar, baz]);

    await store.save(updatedUserGroup.id, updatedUserGroup);

    // assert
    var loadedUserGroup = await store.load(initialUserGroup.id);

    expect(loadedUserGroup, isNotNull);
    expect(loadedUserGroup!.members.values, containsAll([foo, updatedBar, baz]));
    expect(loadedUserGroup.members.keys, containsAll([foo, updatedBar, baz].map((e) => e.uid)));
  });

  test(
      """
  Given a store with existing user group (A),
  When saveAll called for updated user group (A) and new user group (B),
  Then verify user group (A) is merged, and user group (B) is saved.
  """,
      () async {
    // arrange
    var foo = const Member(uid: "1", name: "1");
    var bar = const Member(uid: "2", name: "2");
    var initialUserGroup = UserGroup.fromMembers(id: "a", members: [foo, bar]);

    await store.save(initialUserGroup.id, initialUserGroup);
    expect(await store.load(initialUserGroup.id), isNotNull);

    // execute
    var updatedBar = bar.copyWith(name: "updated-2");
    var baz = const Member(uid: "3", name: "3");
    var updatedUserGroup = UserGroup.fromMembers(id: "a", members: [updatedBar, baz]);

    var quz = const Member(uid: "4", name: "4");
    var newUserGroup = UserGroup.fromMembers(id: "b", members: [foo, quz]);

    await store.saveAll([updatedUserGroup, newUserGroup].toMap(keyConverter: (e) => e.id, valueConverter: (e) => e));

    // assert
    var loadedUpdatedUserGroup = await store.load(initialUserGroup.id);
    expect(loadedUpdatedUserGroup, isNotNull);
    expect(loadedUpdatedUserGroup!.members.values, containsAll([foo, updatedBar, baz]));
    expect(loadedUpdatedUserGroup.members.keys, containsAll([foo, updatedBar, baz].map((e) => e.uid)));

    var loadedNewUserGroup = await store.load(newUserGroup.id);
    expect(loadedNewUserGroup, isNotNull);
    expect(loadedNewUserGroup!.members.values, containsAll([foo, quz]));
    expect(loadedNewUserGroup.members.keys, containsAll([foo, quz].map((e) => e.uid)));
  });
}
