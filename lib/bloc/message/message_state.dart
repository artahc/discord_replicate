import 'package:discord_replicate/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_state.freezed.dart';

@freezed
abstract class MessageState with _$MessageState {
  const factory MessageState.initial() = MessageStateInitial;
  const factory MessageState.sendingMessage(PendingMessage message) = MessageStateSending;
  const factory MessageState.receivedNewMessage(MessageWithMember message) = MessageStateNewMessage;
  const factory MessageState.messageFetched(List<MessageWithMember> messages) = MessageStateMessageFetched;
}
