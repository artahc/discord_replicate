import 'dart:developer';

import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:hive/hive.dart';

class HiveConstants {
  HiveConstants._();

  static const int SERVER_TYPE = 0;
  static const int USER_TYPE = 1;
  static const int CHANNEL_TYPE = 2;

  static const String USER_BOX = "user";
  static const String SERVER_BOX = "server";
}

abstract class DatabaseService {
  Future put<T>(dynamic key, T value);
  Future putAll<T>(Map<dynamic, T> values);
  Future<T?> get<T>(dynamic key);
}

class HiveDatabaseService implements DatabaseService {
  Map<Type, String> _boxName = {
    User: HiveConstants.USER_BOX,
    Server: HiveConstants.SERVER_BOX,
  };

  void initialize() {
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(ServerAdapter())
      ..registerAdapter(ChannelAdapter());
  }

  Future<Box<T>> _getBox<T>() async {
    if (!_boxName.containsKey(T)) throw Exception("Box not found for this type $T");

    var name = _boxName[T]!;

    if (!Hive.isBoxOpen(name))
      return await Hive.openBox(name);
    else
      return Future.value(Hive.box(name));
  }

  Future put<T>(dynamic key, T value) async {
    Box<T> box = await _getBox();
    box.put(key, value);
  }

  Future<T?> get<T>(dynamic key) async {
    Box<T> box = await _getBox<T>();
    var result = box.get(key);
    return result;
  }

  Future putAll<T>(Map<dynamic, T> values) async {
    Box<T> box = await _getBox<T>();
    await box.putAll(values);
  }
}
