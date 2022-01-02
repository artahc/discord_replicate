import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserStateInitial;

  const factory UserState.loadRecentPrivateRoomInProgress() = UserStateLoadRecentPrivateRoomInProgress;
  const factory UserState.loadRecentPrivateRoomSuccess(List<Room> rooms, Room recentRoom) = UserStateLoadRecentPrivateRoomSuccess;

  const factory UserState.loadLocalUserInProgress() = UserStateLoadLocalUserInProgress;
  const factory UserState.loadLocalUserSuccess(User user) = UserStateLoadLocalUserSuccess;
  const factory UserState.loadLocalUserFailed() = UserStateLoadLocalUserFailed;
}
