import 'dart:developer';

import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConstants {
  static const int SERVER_TYPE = 0;
  static const int CHANNEL_TYPE = 1;
  static const int CHANNEL_ACCESS_TYPE = 2;
  static const int PROFILE_TYPE = 4;
  static const int USER_TYPE = 3;
}

class HiveDatabaseHelper {
  static Future<void> registerAdapters() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ServerAdapter())
      ..registerAdapter(ChannelAdapter())
      ..registerAdapter(ChannelAccessAdapter());
  }

  Future<Box<T>> getBox<T>(String name) async {
    if (!Hive.isBoxOpen(name))
      return await Hive.openBox(name);
    else
      return Future.value(Hive.box(name));
  }
}
