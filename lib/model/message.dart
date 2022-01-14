import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'message.g.dart';

enum MessageType { TEXT, IMAGE, GIF }

@HiveType(typeId: HiveConstants.MESSAGE_TYPE)
class Message extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String senderId;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String message;

  @HiveField(7)
  final String status;

  Message({required this.id, required this.senderId, required this.date, required this.message, required this.status});

  factory Message.dummy() {
    var random = Random().nextInt(1000);
    return Message(
      id: "message-id-$random",
      senderId: "sender-id-$random",
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      date: DateTime.now(),
      status: "Pending",
    );
  }

  factory Message.fromJson(Map<String, dynamic> map) {
    try {
      var id = map['id'] as String;
      var senderId = map['senderRef'] as String;
      var date = DateTime.fromMillisecondsSinceEpoch((map['timestamp'] as int) * 1000);
      var message = map['message'] as String;

      return Message(id: id, senderId: senderId, date: date, message: message, status: "Pending");
    } catch (e) {
      throw ParsingException("Error when parsing Message from JSON.", payload: map, source: e);
    }
  }

  @override
  List<Object?> get props => [id, senderId, message];
}
