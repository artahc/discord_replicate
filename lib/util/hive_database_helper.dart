import 'dart:developer';

import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConstants {
  HiveConstants._();

  static const int SERVER_TYPE = 0;
  static const int CHANNEL_TYPE = 1;
  static const int CHANNEL_ACCESS_TYPE = 2;
  static const int USER_TYPE = 3;
  static const int PROFILE_TYPE = 4;
  static const int ROOM_TYPE = 5;

  static const String USER_BOX = "user";
  static const String SERVER_BOX = "server";
}

class HiveDatabaseHelper {
  static Future<void> initialize() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ServerAdapter())
      ..registerAdapter(ChannelAdapter())
      ..registerAdapter(ChannelAccessAdapter())
      ..registerAdapter(RoomAdapter());
  }

  Future<Box<T>> _getBox<T>(String name) async {
    if (!Hive.isBoxOpen(name))
      return await Hive.openBox(name);
    else
      return Future.value(Hive.box(name));
  }

  Future put<T>(String boxName, dynamic key, T value) async {
    Box<T> box = await _getBox(boxName);
    box.put(key, value);
  }

  Future<T?> get<T>(String boxName, dynamic key) async {
    Box<T> box = await _getBox<T>(boxName);
    var result = box.get(key);
    return result;
  }

  Future putAll<T>(String boxName, Map<dynamic, T> values) async {
    Box<T> box = await _getBox<T>(boxName);
    await box.putAll(values);
  }
}
