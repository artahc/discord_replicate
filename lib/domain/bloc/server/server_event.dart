import 'package:discord_ui_practice/data/model/server_data.dart';

abstract class ServerEvent {}

class ServerListLoadEvent extends ServerEvent {}

class ServerLoadSelectedEvent extends ServerEvent {
  final ServerData serverData;

  ServerLoadSelectedEvent(this.serverData);
}
