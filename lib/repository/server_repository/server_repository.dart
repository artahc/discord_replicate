import 'package:discord_replicate/model/server/server.dart';

abstract class ServerRepository {
  Future<Server> getServer(String id);
  Future<void> saveServer(Server server);
  Future<void> saveServers(List<Server> servers);
}
