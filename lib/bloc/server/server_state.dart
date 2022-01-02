import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_state.freezed.dart';

@freezed
abstract class ServerState with _$ServerState {
  const factory ServerState.initial() = ServerStateInitial;

  const factory ServerState.loadServerInProgress() = ServerStateLoadServerInProgress;
  const factory ServerState.loadServerSuccess(Server server, Channel recentChannel) = ServerStateLoadSelectedSuccess;
}
