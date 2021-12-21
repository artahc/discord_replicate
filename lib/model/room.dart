import 'package:discord_replicate/model/message.dart';

class Room {
  final String id;
  final List<Message> messages;

  Room({required this.id, required this.messages});
}
