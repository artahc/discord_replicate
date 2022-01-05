import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:equatable/equatable.dart';

enum MessageType { TEXT, IMAGE, GIF }

abstract class Message {
  final String id;
  final String senderId;
  final DateTime date;

  Message({required this.id, required this.senderId, required this.date});

  factory Message.dummy() {
    var random = Random().nextInt(1000);
    return TextMessage(
      id: "message-id-$random",
      senderId: "sender-id-$random",
      message:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      date: DateTime.now(),
    );
  }

  factory Message.fromJson(Map<String, dynamic> map) {
    try {
      var id = map['id'] as String;
      var senderId = map['senderRef'] as String;
      var date = DateTime.fromMillisecondsSinceEpoch((map['timestamp'] as int) * 1000);
      var message = map['message'] as String;

      return TextMessage(
        id: id,
        senderId: senderId,
        date: date,
        message: message,
      );
    } catch (e) {
      throw ParsingException("Error when parsing Message from JSON.", payload: map, source: e);
    }
  }
}

class TextMessage extends Message with EquatableMixin {
  final String message;

  TextMessage({
    required String id,
    required String senderId,
    required DateTime date,
    required this.message,
  }) : super(id: id, date: date, senderId: senderId);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "senderId": senderId,
      "date": date.millisecondsSinceEpoch / 1000,
      "message": message,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }

  @override
  List<Object?> get props => [id, senderId, date, message];
}
