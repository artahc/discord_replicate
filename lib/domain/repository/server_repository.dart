import 'package:discord_replicate/domain/model/server/server.dart';

import 'package:get_it/get_it.dart';

abstract class ServerRepository implements Disposable {
  Future<Server> getServerById(String id);
  Future<void> saveServer(Server server);
  Future<void> saveAllServers(List<Server> servers);
  Future<Server> joinServer(String serverId);
  Future<void> leaveServer(String serverId);
}
