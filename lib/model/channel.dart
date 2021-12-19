import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'channel.g.dart';

@HiveType(typeId: 4)
enum ChannelAccess {
  @HiveField(0)
  PUBLIC,

  @HiveField(1)
  PRIVATE
}

@HiveType(typeId: 3)
class Channel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String roomId;

  @HiveField(3)
  final ChannelAccess access;

  Channel({required this.id, required this.name, required this.roomId, required this.access});

  factory Channel.dummy() => Channel(id: "id", name: "name", roomId: "roomId", access: ChannelAccess.PRIVATE);

  factory Channel.fromJson(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      name: map['name'],
      roomId: map['roomId'],
      access: ChannelAccess.values.where((e) => e.name == map['access']).first,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "roomId": roomId,
      "access": access.name,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
