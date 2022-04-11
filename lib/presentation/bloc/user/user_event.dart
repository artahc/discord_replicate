import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  // const factory UserEvent.loadPrivateChannels() = UserEventLoadPrivateChannels;
  // const factory UserEvent.notifyUserChanged(User user) = UserEventNotifyUserChanged;
  const factory UserEvent.loadUser() = UserEventLoadLocalUser;
  const factory UserEvent.deleteUser() = UserEventDeleteLocalUser;
}
