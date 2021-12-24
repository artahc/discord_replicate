import 'dart:math';

import 'package:discord_replicate/model/message.dart';

class Room {
  final String id;
  final List<Message> messages;

  Room({required this.id, required this.messages});

  factory Room.dummy() => Room(id: "room-id-${Random().nextInt(1000)}", messages: List.generate(25, (index) => TextMessage.dummy()));
}
