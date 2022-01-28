import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.empty() = UserStateEmpty;
  const factory UserState.loading() = UserStateLoadLoading;
  const factory UserState.loaded(User user) = UserStateLoaded;
  const factory UserState.error(Exception e) = UserStateLoadUserError;
}
