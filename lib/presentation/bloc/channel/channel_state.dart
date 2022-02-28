import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_state.freezed.dart';

@freezed
class ChannelState with _$ChannelState {
  factory ChannelState.loading() = ChannelStateLoading;
  factory ChannelState.error(Exception e) = ChannelStateError;
  factory ChannelState.loaded({
    required Channel channel,
  }) = ChannelStateLoaded;
}
