import 'package:discord_replicate/domain/model/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/direct_message_state.freezed.dart';

@freezed
class DirectMessageState with _$DirectMessageState {
  const factory DirectMessageState.empty() = DirectMessageStateEmpty;
  const factory DirectMessageState.loading() = DirectMessageLoading;
  const factory DirectMessageState.loaded(Channel channel) = DirectMessageStateLoaded;
}
