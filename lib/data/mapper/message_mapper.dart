import 'dart:async';

import 'package:discord_replicate/data/mapper/mapper.dart';
import 'package:discord_replicate/data/model/message_model.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MessageMapper implements Mapper<MessageModel, Message> {
  @override
  FutureOr<Message> map(MessageModel from) {
    return Message(
      id: from.id,
      senderRef: from.senderRef,
      date: DateTime.fromMillisecondsSinceEpoch(from.timestamp),
      message: from.message,
    );
  }
}
