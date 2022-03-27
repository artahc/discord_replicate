import 'package:discord_replicate/domain/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/message_state.freezed.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    @Default(<Message>[]) List<Message> messages,
    @Default(<Message>[]) List<Message> pendingMessages,
  }) = _MessageState;
}
