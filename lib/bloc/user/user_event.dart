import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.loadUser() = UserEventLoadLocalUser;
  const factory UserEvent.deleteUser() = UserEventDeleteLocalUser;
}
