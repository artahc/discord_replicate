import 'package:discord_replicate/model/server_data.dart';

abstract class ServerState {}

class ServerStateInitial extends ServerState {}

class ServerStateLoadListInProgress extends ServerState {}

class ServerStateLoadListSuccess extends ServerState {
  final List<ServerData> serverList;

  ServerStateLoadListSuccess(this.serverList);
}

class ServerStateLoadListFailed extends ServerState {}
