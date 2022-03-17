import 'dart:async';

import 'package:discord_replicate/application/extensions/extensions.dart';
import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:hive/hive.dart';

class HiveUserStore implements Store<User> {
  HiveUserStore();

  FutureOr<Box<User>> getBox() async {
    if (!Hive.isBoxOpen(HiveConstants.USER_BOX))
      return Hive.openBox(HiveConstants.USER_BOX);
    else
      return Hive.box(HiveConstants.USER_BOX);
  }

  @override
  Future<bool> exist(String id) async {
    var box = await getBox();
    return box.containsKey(id);
  }

  @override
  Future<User?> load(String id) async {
    var box = await getBox();
    return box.get(id);
  }

  @override
  Future<List<User>> loadAll() async {
    var box = await getBox();
    return box.values.toList();
  }

  @override
  FutureOr onDispose() async {
    var box = await getBox();
    await box.deleteFromDisk();
  }

  @override
  Future<void> save(User user) async {
    var box = await getBox();
    await box.put(user.uid, user);
  }

  @override
  Future<void> saveAll(List<User> items) async {
    var box = await getBox();
    var entries = items.toMap<String, User>(keyConverter: (e) => e.uid, valueConverter: (e) => e);
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
  Stream<ObservableEntityEvent<User>> observe({String? id}) async* {
    var box = await getBox();
    yield* box.watch(key: id).map((event) {
      var e = event.deleted ? EntityEvent.DELETED : EntityEvent.CREATED_OR_UPDATED;
      return ObservableEntityEvent<User>(e, event.key, event.value);
    });
  }
}
