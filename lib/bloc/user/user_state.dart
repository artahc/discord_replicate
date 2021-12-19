import 'package:discord_replicate/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserStateInitial;
  const factory UserState.userLoaded(User user) = UserStateUserLoaded;
}
