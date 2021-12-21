import 'dart:math';

import 'package:discord_replicate/model/user.dart';

abstract class Message {
  final String id;
  final User sender;
  final DateTime sentDate;

  Message(this.id, this.sender, this.sentDate);
}

class TextMessage extends Message {
  final String textMessage;

  TextMessage({
    required String id,
    required User sender,
    required DateTime sentDate,
    required this.textMessage,
  }) : super(id, sender, sentDate);

  factory TextMessage.dummy() {
    var random = Random().nextInt(1000);
    return TextMessage(
      id: "message-id-$random",
      sender: RemoteUser.dummy(),
      sentDate: DateTime.now(),
      textMessage:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer laoreet eget velit non lobortis. Proin malesuada est eu efficitur luctus. Nunc aliquet dui quis dui maximus, eu porta orci bibendum. Pellentesque ac urna ullamcorper nunc elementum tempus vel vel lorem. Fusce posuere nunc nec neque imperdiet, id tempus eros rhoncus.",
    );
  }
}
