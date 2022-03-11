import 'package:discord_replicate/domain/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '__generated/message_event.freezed.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  const factory MessageEvent.fetchInitialMessage() = MessageEventFetchInitialMessages;
  const factory MessageEvent.fetchPreviousMessage(String lastMessageId, int limit) = MessageEventFetchPreviousMessage;
  const factory MessageEvent.fetchLatestMessage() = MessageEventFetchLatestMessage;
  const factory MessageEvent.sendMessage(String message) = MessageEventSendMessage;
  const factory MessageEvent.notifyNewMessage(Message message) = MessageEventNotifyNewMessage;
}
