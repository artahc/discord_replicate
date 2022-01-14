import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_state.freezed.dart';

@freezed
abstract class ChannelState with _$ChannelState {
  const factory ChannelState.initial() = ChannelStateInitial;
  const factory ChannelState.loadInProgress() = ChannelStateLoadInProgress;
  const factory ChannelState.loadFailed(Exception e) = ChannelStateLoadFailed;
  const factory ChannelState.loadSuccess(Channel channel) = ChannelStateLoadSuccess;
}
