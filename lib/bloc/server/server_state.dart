import 'package:discord_replicate/model/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_state.freezed.dart';

@freezed
abstract class ServerState with _$ServerState {
  const factory ServerState.initial() = ServerStateInitial;
  const factory ServerState.loadListSuccess(List<Server> servers) = ServerStateLoadListSuccess;
  const factory ServerState.loadSelectedSuccess(Server server) = ServerStateLoadSelectedSuccess;
}
