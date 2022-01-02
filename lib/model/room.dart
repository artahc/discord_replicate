import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'room.g.dart';

@HiveType(typeId: HiveConstants.ROOM_TYPE)
class Room extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<User> members;

  @HiveField(3)
  final List<Message> messages;

  Room({
    required this.id,
    required this.name,
    this.members = const <User>[],
    this.messages = const <Message>[],
  });

  factory Room.dummy() {
    var random = Random().nextInt(1000);
    return Room(
      id: "room-id-$random",
      name: "room-name",
      members: List.generate(15, (index) => User.dummy()),
      messages: List.generate(15, (index) => Message.dummy()),
    );
  }

  factory Room.fromJson(Map<String, dynamic> map) {
    try {
      var id = map['id'] as String;
      var name = map['name'] as String;

      var members = <User>[];
      if (map.containsKey('members') && (map['members'] as List<Object?>).isNotEmpty)
        members = (map['members'] as List<Object?>).map((e) => User.fromJson(e as Map<String, dynamic>)).toList();

      var messages = <Message>[];
      if (map.containsKey('messages') && (map['messages'] as List<Object?>).isNotEmpty)
        messages = (map['messages'] as List<Object?>).map((e) => Message.fromJson(e as Map<String, dynamic>)).toList();

      return Room(
        id: id,
        name: name,
        members: members,
        messages: messages,
      );
    } catch (e) {
      throw ParsingException("Error when parsing Room from JSON.", payload: map, source: e);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "members": members,
      "messages": messages,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }

  @override
  List<Object?> get props => [id, name];
}
