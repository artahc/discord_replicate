import 'package:discord_replicate/model/room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_state.freezed.dart';

@freezed
class RoomState with _$RoomState {
  const factory RoomState.initial() = RoomStateInitial;
  const factory RoomState.roomLoadInProgress() = RoomStateLoadingRoom;
  const factory RoomState.roomLoadSuccess(Room room) = RoomStateLoadRoomSuccess;
  const factory RoomState.roomLoadFailed(Exception error) = RoomStateLoadRoomFailed;
}
