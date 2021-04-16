import 'package:discord_ui_practice/model/server_data.dart';

class ServerRepository {
  ServerData _currentServer;
  List<ServerData> _allServer;

  ServerData getCurrentServer() => _currentServer;

  void setCurrentServer(ServerData serverData) {
    this._currentServer = serverData;
  }

  List<ServerData> getAllServer() => _allServer;

  void setAllServer(List<ServerData> serverDatas) {
    this._allServer = serverDatas;
  }
}
