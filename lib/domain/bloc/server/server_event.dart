import 'package:discord_replicate/data/model/server_data.dart';

abstract class ServerEvent {
  ServerEvent._();

  factory ServerEvent.loadServerList() => ServerListLoadEvent();
}

class ServerListLoadEvent extends ServerEvent {
  ServerListLoadEvent() : super._();
}

class ServerLoadSelectedEvent extends ServerEvent {
  final ServerData serverData;

  ServerLoadSelectedEvent(this.serverData) : super._();
}
