import 'dart:math';

import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Room extends HiveObject with EquatableMixin {
  final String id;
  final String name;
  final List<User> members;
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
      messages: List.generate(25, (index) => Message.dummy()),
    );
  }

  factory Room.fromJson(Map<String, dynamic> map) {
    try {
      var id = map['id'] as String;
      var name = map['name'] as String;
      var members = map['members'] as List<Object?>;
      var messages = map['messages'] as List<Object?>;

      return Room(
        id: id,
        name: name,
        members: members.map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
        messages: messages.map((e) => Message.fromJson(e as Map<String, dynamic>)).toList(),
      );
    } catch (e) {
      throw FormatException("Error when parsing Room from JSON.", e);
    }
  }

  @override
  List<Object?> get props => [id, name];
}
