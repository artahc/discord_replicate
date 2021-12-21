import 'dart:math';

import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

abstract class User extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String? about;

  // @HiveField(2)
  // final List<Server> servers;

  User({required this.uid, required this.username, required this.about});

  // factory User.fromJson(Map<String, dynamic> json) => User(uid: json['uid'], username: json['username']);
  // factory User.dummy() {
  //   var random = Random().nextInt(15);
  //   return User(
  //     uid: "id+$random",
  //     username: "name+$random",
  //     // username: "username+$random",
  //     // servers: List.generate(5, (index) => Server.dummy(index)),
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {"uid": uid, "username": username};
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}

@HiveType(typeId: HiveConstants.LOCAL_USER_TYPE)
class LocalUser extends User {
  @HiveField(5)
  final List<Server> servers;

  LocalUser({
    required String uid,
    required String username,
    required String? about,
    required this.servers,
  }) : super(uid: uid, username: username, about: about);

  factory LocalUser.dummy() {
    var random = Random().nextInt(15);
    return LocalUser(
      uid: "id+$random",
      username: "name+$random",
      about: "about+$random",
      servers: List.generate(10, (index) => Server.dummy(index)),
    );
  }

  factory LocalUser.fromJson(Map<String, dynamic> map) {
    var servers = (map['servers'] as List<Object?>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList();
    return LocalUser(
      uid: map['uid'] as String,
      username: map['username'] as String,
      about: map['about'] as String?,
      servers: servers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": username,
      "about": about,
      "servers": servers,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}

@HiveType(typeId: HiveConstants.REMOTE_USER_TYPE)
class RemoteUser extends User {
  @HiveField(5)
  final List<Server> mutualServers;

  RemoteUser({
    required String uid,
    required String username,
    required String? about,
    required this.mutualServers,
  }) : super(uid: uid, username: username, about: about);

  factory RemoteUser.dummy() {
    var random = Random().nextInt(15);
    return RemoteUser(
      uid: "id+$random",
      username: "name+$random",
      about: "about+$random",
      mutualServers: List.generate(5, (index) => Server.dummy(index)),
    );
  }

  factory RemoteUser.fromJson(Map<String, dynamic> map) {
    var servers = (map['servers'] as List<Object?>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList();
    return RemoteUser(
      uid: map['uid'] as String,
      username: map['username'] as String,
      about: map['about'] as String?,
      mutualServers: servers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": username,
      "about": about,
      "servers": mutualServers,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
