import 'package:discord_ui_practice/model/server_data.dart';

abstract class ServerState {}

class ServerLoadAllInitial extends ServerState {}

class ServerLoadAllInProgress extends ServerState {}

class ServerLoadAllSuccess extends ServerState {
  final List<ServerData> servers;

  ServerLoadAllSuccess(this.servers);
}

class ServerLoadAllFailure extends ServerState {}
