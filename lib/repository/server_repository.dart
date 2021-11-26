import 'package:discord_replicate/model/server_data.dart';

class ServerRepository {
  late ServerData _currentServer;
  late List<ServerData> _allServer;

  ServerData getCurrentServer() => _currentServer;

  void setCurrentServer(ServerData serverData) {
    this._currentServer = serverData;
  }

  List<ServerData> getAllServer() => _allServer;

  void setAllServer(List<ServerData> serverDatas) {
    this._allServer = serverDatas;
  }
}
