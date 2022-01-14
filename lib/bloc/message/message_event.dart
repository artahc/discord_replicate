import 'package:discord_replicate/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_event.freezed.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  const factory MessageEvent.sendMessage(Message message) = MessageEventSendMessage;
}
