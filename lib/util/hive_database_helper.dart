import 'dart:developer';

import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabaseHelper {
  static Future<void> registerAdapters() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive
      ..registerAdapter(UserAdapter(), override: true)
      ..registerAdapter(ServerAdapter(), override: true)
      ..registerAdapter(ChannelAdapter(), override: true)
      ..registerAdapter(ChannelAccessAdapter(), override: true);
  }

  Future<Box<T>> getBox<T>(String name) async {
    if (!Hive.isBoxOpen(name))
      return await Hive.openBox(name);
    else
      return Future.value(Hive.box(name));
  }
}
