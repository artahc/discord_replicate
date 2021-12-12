import 'package:discord_replicate/model/channel.dart';
import 'package:flutter/material.dart';

@immutable
class Server {
  final String id;
  final String name;
  final List<Channel> channels;

  Server(this.id, this.name, this.channels);

  factory Server.dummy(int id) => Server("serverId_$id", "name", [Channel.dummy()]);

  factory Server.fromMap(Map<String, dynamic> source) {
    var id = source["id"] as String;
    var name = source["name"] as String;
    var channels = source["channels"];
    return Server(id, name, channels);
  }
}
