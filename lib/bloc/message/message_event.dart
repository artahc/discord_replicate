import 'package:discord_replicate/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_event.freezed.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  const factory MessageEvent.fetchInitialMessage() = MessageEventFetchInitialMessages;
  const factory MessageEvent.sendMessage(String message) = MessageEventSendMessage;
  const factory MessageEvent.notifyNewMessage(MessageWithMember message) = MessageEventNotifyNewMessage;
}
