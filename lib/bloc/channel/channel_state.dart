import 'package:discord_replicate/model/channel/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_state.freezed.dart';

@freezed
abstract class ChannelState with _$ChannelState {
  const ChannelState();
  const factory ChannelState.loading() = ChannelStateLoading;
  const factory ChannelState.error(Exception e) = ChannelStateError;
  const factory ChannelState.loaded(Channel channel) = ChannelStateLoaded;
}
