import 'dart:math';

import 'package:discord_replicate/model/server.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final List<Server> servers;

  User({required this.uid, required this.username, this.servers = const <Server>[]});

  factory User.dummy() {
    var random = Random().nextInt(15);
    return User(
      uid: "id+$random",
      username: "username+$random",
      servers: List.generate(5, (index) => Server.dummy(index)),
    );
  }

  factory User.fromJson(Map<String, dynamic> map) {
    var servers = (map['servers'] as List<Object?>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList();
    return User(
      uid: map['uid'] as String,
      username: map['username'] as String,
      servers: servers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "username": username,
      "servers": servers,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
