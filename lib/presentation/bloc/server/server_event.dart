import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/server_event.freezed.dart';

@freezed
abstract class ServerEvent with _$ServerEvent {
  const factory ServerEvent.loadServer(String serverId) = ServerEventLoadServer;
  const factory ServerEvent.joinServer(String serverId) = ServerEventJoinServer;
  const factory ServerEvent.leaveServer(String serverId) = ServerEventLeaveServer;
}
