import 'package:discord_replicate/model/channel.dart';
import 'package:flutter/material.dart';

@immutable
class Server {
  final String id;
  final String name;
  final List<Channel> channels;

  Server({required this.id, required this.name, this.channels = const []});

  factory Server.dummy(int id) => Server(id: "serverId_$id", name: "name", channels: [Channel.dummy()]);

  factory Server.fromMap(Map<String, dynamic> source) {
    var id = source["id"] as String;
    var name = source["name"] as String;
    var channels = (source["channels"] as List<Object?>).map((e) {
      var map = e as Map<String, dynamic>;
      return Channel.fromMap(map);
    }).toList();

    return Server(id: id, name: name, channels: channels);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "channels": channels.toList(),
    };
  }
}
