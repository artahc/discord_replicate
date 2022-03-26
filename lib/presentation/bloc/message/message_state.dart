import 'package:discord_replicate/domain/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/message_state.freezed.dart';

@freezed
abstract class MessageState with _$MessageState {
  const factory MessageState.initial() = MessageStateInitial;
  const factory MessageState.loading() = MessageStateLoading;
  const factory MessageState.loaded(List<Message> messages) = MessageStateMessageFetched;
}
