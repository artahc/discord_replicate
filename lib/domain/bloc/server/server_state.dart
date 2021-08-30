import 'package:discord_ui_practice/data/model/server_data.dart';

abstract class ServerState {}

class ServerListInitial extends ServerState {}

class ServerListLoadInProgress extends ServerState {}

class ServerListLoaded extends ServerState {
  final List<ServerData> serverData;

  ServerListLoaded(this.serverData);
}

class ServerListLoadFailed extends ServerState {}
