import 'dart:async';

import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:discord_replicate/common/extensions/app_extension.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/common/config/hive_constants.dart';
import 'package:hive/hive.dart';

class HiveUserGroupStore implements Store<UserGroup> {
  HiveUserGroupStore();

  FutureOr<Box<UserGroup>> getBox() async {
    if (!Hive.isBoxOpen(HiveConstants.USER_GROUP_BOX))
      return Hive.openBox(HiveConstants.USER_GROUP_BOX);
    else
      return Hive.box(HiveConstants.USER_GROUP_BOX);
  }

  @override
  Future<bool> exist(String id) async {
    var box = await getBox();
    return box.containsKey(id);
  }

  @override
  Future<UserGroup?> load(String id) async {
    var box = await getBox();
    return box.get(id);
  }

  @override
  Future<List<UserGroup>> loadAll() async {
    var box = await getBox();
    return box.values.toList();
  }

  @override
  FutureOr onDispose() async {
    var box = await getBox();
    await box.deleteFromDisk();
  }

  @override
  Future<void> save(UserGroup userGroup) async {
    var box = await getBox();
    await box.put(userGroup.id, userGroup);
  }

  @override
  Future<void> saveAll(List<UserGroup> items) async {
    var box = await getBox();
    var entries = items.toMap<String, UserGroup>(keyConverter: (e) => e.id, valueConverter: (e) => e);
    await box.putAll(entries);
  }

  @override
  Future<void> delete(String id) async {
    var box = await getBox();
    await box.delete(id);
  }

  @override
  Future<void> deleteAll(List<String> ids) async {
    var box = await getBox();
    await box.deleteAll(ids);
  }

  @override
  Stream<ObservableEntityEvent<UserGroup>> observe({String? id}) {
    // TODO: implement observe
    throw UnimplementedError();
  }
}
