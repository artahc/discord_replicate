import 'dart:math';

import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: HiveConstants.USER_TYPE)
class User extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? about;

  @HiveField(3)
  final String? avatarUrl;

  @HiveField(4)
  final List<Server> servers;

  User({
    required this.uid,
    required this.name,
    required this.avatarUrl,
    required this.about,
    this.servers = const <Server>[],
  });

  factory User.dummy() {
    var random = Random().nextInt(15);
    return User(
      uid: "id+$random",
      name: "name+$random",
      avatarUrl: "avatarUrl+$random",
      about: "about+$random",
      servers: List.generate(10, (index) => Server.dummy(index)),
    );
  }

  factory User.fromJson(Map<String, dynamic> map) {
    try {
      var servers = <Server>[];
      if (map.containsKey('servers') && (map['servers'] as List<Object?>).isNotEmpty) {
        servers = (map['servers'] as List<Object?>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList();
      }

      return User(
        uid: map['uid'] as String,
        name: map['name'] as String,
        avatarUrl: map['avatarUrl'] as String?,
        about: map['about'] as String?,
        servers: servers,
      );
    } catch (e) {
      throw Exception("Error parsing User from JSON");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "avatarUrl": avatarUrl,
      "about": about,
      if (servers.isNotEmpty) "servers": servers,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }

  @override
  List<Object?> get props => [uid];
}
