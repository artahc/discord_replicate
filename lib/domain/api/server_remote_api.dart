import 'package:discord_replicate/domain/model/server/server.dart';

abstract class ServerRemoteApi {
  Future<Server> getServerById(String id);
  Future<Server> joinServer(String serverId);
  Future<Server> leaveServer(String serverId);
}
