import 'package:discord_replicate/model/channel/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'direct_message_state.freezed.dart';

@freezed
class DirectMessageState with _$DirectMessageState {
  const factory DirectMessageState.empty() = DirectMessageStateEmpty;
  const factory DirectMessageState.loading() = DirectMessageLoading;
  const factory DirectMessageState.loaded(Channel channel) = DirectMessageStateLoaded;
}
