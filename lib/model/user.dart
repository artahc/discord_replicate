import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
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

  @HiveField(5)
  final List<Channel> privateRooms;

  User({
    required this.uid,
    required this.name,
    required this.avatarUrl,
    required this.about,
    this.servers = const <Server>[],
    this.privateRooms = const <Channel>[],
  });

  factory User.dummy() {
    var random = Random().nextInt(15);
    return User(
      uid: "id+$random",
      name: "name+$random",
      avatarUrl: "avatarUrl+$random",
      about: "about+$random",
      servers: [
        Server(
          id: "dummy_id$random",
          imageUrl: "dummy",
          name: "dummy",
          channels: [
            Channel(
              id: "dummy_id_$random",
              name: "room-name",
              members: [User(uid: "uid", name: "name", avatarUrl: "avatarUrl", about: "about")],
              messages: [Message.dummy()],
            )
          ],
        ),
      ],
      privateRooms: [
        Channel(
          id: "dummy_id_$random",
          name: "room-name",
          members: [User(uid: "uid", name: "name", avatarUrl: "avatarUrl", about: "about")],
          messages: [Message.dummy()],
        )
      ],
    );
  }

  factory User.fromJson(Map<String, dynamic> map) {
    try {
      var servers = <Server>[];
      var privateRooms = <Channel>[];
      var about = "";

      if (map.containsKey('servers') && (map['servers'] as List<Object?>).isNotEmpty) {
        servers = (map['servers'] as List<Object?>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList();
      }

      if (map.containsKey('privateRooms') && (map['privateRooms'] as List<dynamic>).isNotEmpty) {
        privateRooms = (map['privateRooms'] as List<dynamic>).map((e) => Channel.fromJson(e as Map<String, dynamic>)).toList();
      }

      if (map.containsKey('about')) about = map['about'] as String;

      return User(
        uid: map['uid'] as String,
        name: map['name'] as String,
        avatarUrl: map['avatarUrl'] as String?,
        about: about,
        servers: servers,
        privateRooms: privateRooms,
      );
    } catch (e) {
      throw ParsingException("Error parsing User from JSON.", payload: map, source: e);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "avatarUrl": avatarUrl,
      "about": about,
      if (servers.isNotEmpty) "servers": servers,
      if (privateRooms.isNotEmpty) "privateRooms": privateRooms
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }

  @override
  List<Object?> get props => [uid];
}

extension MapExtensions<T> on Map<String, T> {
  T tryGet<T>(dynamic key) {
    if (this.containsKey(key))
      return this[key] as T;
    else {
      throw Exception("Key $key not found on $this");
    }
  }
}
