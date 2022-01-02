import 'dart:developer';
import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'channel.g.dart';

@HiveType(typeId: HiveConstants.CHANNEL_ACCESS_TYPE)
enum ChannelAccess {
  @HiveField(0)
  PUBLIC,

  @HiveField(1)
  PRIVATE
}

@HiveType(typeId: HiveConstants.CHANNEL_TYPE)
class Channel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String roomId;

  @HiveField(3)
  final ChannelAccess access;

  Channel({required this.id, required this.name, required this.roomId, required this.access});

  factory Channel.dummy() {
    var random = Random().nextInt(1000);
    return Channel(
      id: "id-$random",
      name: "Channel $random",
      roomId: "roomId-$random",
      access: ChannelAccess.PRIVATE,
      // category: "Text Channels",
    );
  }

  factory Channel.fromJson(Map<String, dynamic> map) {
    try {
      return Channel(
        id: map['id'],
        name: map['name'],
        roomId: map['room']['id'],
        access: ChannelAccess.values.where((e) => e.name == map['access']).first,
      );
    } catch (e) {
      throw ParsingException("Error when parsing Channel from JSON", payload: map, source: e);
    }
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

  @override
  List<Object?> get props => [id, name, roomId, access];
}
