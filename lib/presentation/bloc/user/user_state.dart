import 'package:discord_replicate/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.empty() = UserStateEmpty;
  const factory UserState.loading() = UserStateLoadLoading;
  const factory UserState.loaded(User user) = UserStateLoaded;
  const factory UserState.error(Exception e) = UserStateLoadUserError;
}
