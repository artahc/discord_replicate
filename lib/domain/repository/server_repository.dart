import 'package:discord_replicate/domain/model/server/server.dart';

import 'package:get_it/get_it.dart';

abstract class ServerRepository implements Disposable {
  Future<Server> getServer(String id);
  Future<void> saveServer(Server server);
  Future<void> saveServers(List<Server> servers);
  Future<Server> joinServer({required String userId, required String serverId});
  Future<Server> leaveServer({required String userId, required String serverId});
}