import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/server_state.freezed.dart';

@freezed
abstract class ServerState with _$ServerState {
  const factory ServerState.error(Exception e) = ServerStateError;
  const factory ServerState.loading() = ServerStateLoading;
  const factory ServerState.loaded(Server server, Channel recentChannel) = ServerStateLoaded;
}
