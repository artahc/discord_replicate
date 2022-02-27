import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  // const factory UserEvent.loadPrivateChannels() = UserEventLoadPrivateChannels;
  const factory UserEvent.loadUser() = UserEventLoadLocalUser;
  const factory UserEvent.deleteUser() = UserEventDeleteLocalUser;
  const factory UserEvent.joinServer({required String serverId}) = UserEventJoinServer;
  const factory UserEvent.leaveServer({required String serverId}) = UserEventLeaveServer;
}
