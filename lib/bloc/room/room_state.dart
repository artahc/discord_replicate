import 'package:discord_replicate/model/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_state.freezed.dart';

@freezed
class RoomState with _$RoomState {
  const factory RoomState.initial() = RoomStateInitial;
  const factory RoomState.loadRoomSuccess(Channel room) = RoomStateLoadRecentRoomSuccess;
}
