import 'dart:async';

import 'package:discord_replicate/domain/model/server/server.dart';
import 'package:discord_replicate/common/app_extension.dart';
import 'package:discord_replicate/common/hive_constants.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:hive/hive.dart';

class HiveServerStore implements Store<Server> {
  HiveServerStore();

  FutureOr<Box<Server>> getBox() async {
    if (!Hive.isBoxOpen(HiveConstants.SERVER_BOX))
      return Hive.openBox(HiveConstants.SERVER_BOX);
    else
      return Hive.box(HiveConstants.SERVER_BOX);
  }

  @override
  Future<bool> exist(String id) async {
    var box = await getBox();
    return box.containsKey(id);
  }

  @override
  Future<Server?> load(String id) async {
    var box = await getBox();
    return box.get(id);
  }

  @override
  Future<List<Server>> loadAll() async {
    var box = await getBox();
    return box.values.toList();
  }

  @override
  FutureOr onDispose() async {
    var box = await getBox();
    await box.deleteFromDisk();
  }

  @override
  Future<void> save(Server server) async {
    var box = await getBox();
    await box.put(server.id, server);
  }

  @override
  Future<void> saveAll(List<Server> items) async {
    var box = await getBox();
    var entries = items.toMap<String, Server>(keyConverter: (e) => e.id, valueConverter: (e) => e);
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
}
