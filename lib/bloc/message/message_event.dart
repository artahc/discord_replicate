import 'package:discord_replicate/model/message/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_event.freezed.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  const factory MessageEvent.fetchInitialMessage() = MessageEventFetchInitialMessages;
  const factory MessageEvent.fetchPreviousMessage(String lastMessageId, int limit) = MessageEventFetchPreviousMessage;
  const factory MessageEvent.fetchLatestMessage() = MessageEventFetchLatestMessage;
  const factory MessageEvent.sendMessage(String message) = MessageEventSendMessage;
  const factory MessageEvent.notifyNewMessage(Message message) = MessageEventNotifyNewMessage;
}
