import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_state.freezed.dart';

@freezed
abstract class ServerState with _$ServerState {
  const factory ServerState.error(Exception e) = ServerStateError;
  const factory ServerState.loading() = ServerStateLoading;
  const factory ServerState.loaded(Server server, Channel recentChannel) = ServerStateLoaded;
}
