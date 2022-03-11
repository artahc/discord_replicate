import 'package:discord_replicate/domain/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '__generated/message_state.freezed.dart';

@freezed
abstract class MessageState with _$MessageState {
  const factory MessageState.initial() = MessageStateInitial;
  const factory MessageState.sendingMessage(Message message) = MessageStateSending;
  const factory MessageState.receivedNewMessage(Message message) = MessageStateNewMessage;
  const factory MessageState.messageFetched(List<Message> messages, bool hasMore, String? cursor) = MessageStateMessageFetched;
}
