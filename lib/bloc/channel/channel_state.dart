import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_state.freezed.dart';

@freezed
abstract class ChannelState with _$ChannelState {
  const factory ChannelState.loading() = ChannelStateLoading;
  const factory ChannelState.error(Exception e) = ChannelStateError;
  const factory ChannelState.loaded(Channel channel) = ChannelStateLoaded;
}
