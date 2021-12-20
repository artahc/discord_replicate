import 'package:discord_replicate/model/credential.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.loadLocalUser() = UserEventLoadMe;
  const factory UserEvent.loadRemoteUser(String uid) = UserEventLoadUser;
}
