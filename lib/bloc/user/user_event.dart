import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {

  const factory UserEvent.loadUser(String uid) = UserEventLoadUser;
  const factory UserEvent.loadLocalUser() = UserEventLoadLocalUser;
}
