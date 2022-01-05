import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserStateInitial;
  const factory UserState.loadUserInProgress() = UserStateLoadLocalUserInProgress;
  const factory UserState.loadUserSuccess(User user) = UserStateLoadLocalUserSuccess;
  const factory UserState.loadUserFailed() = UserStateLoadLocalUserFailed;
}
