import 'package:discord_replicate/domain/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/message_event.freezed.dart';

@freezed
abstract class MessageEvent with _$MessageEvent {
  const factory MessageEvent.refresh() = MessageEventRefresh;
  const factory MessageEvent.fetchPreviousMessage(int limit) = MessageEventFetchPreviousMessage;
  const factory MessageEvent.fetchLatestMessage() = MessageEventFetchLatestMessage;
  const factory MessageEvent.sendMessage(String message) = MessageEventSendMessage;
}
