import 'package:discord_replicate/domain/model/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '__generated/channel_state.freezed.dart';

@freezed
class ChannelState with _$ChannelState {
  factory ChannelState.empty() = ChannelStateEmpty;
  factory ChannelState.loading() = ChannelStateLoading;
  factory ChannelState.loaded({required Channel channel}) = ChannelStateLoaded;
  factory ChannelState.error(Exception exception, StackTrace stackTrace) = ChannelStateError;
}
