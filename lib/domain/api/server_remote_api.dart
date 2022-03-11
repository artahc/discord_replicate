import 'package:discord_replicate/domain/model/server.dart';

abstract class ServerRemoteApi {
  Future<Server> getServerById(String id);
  Future<Server> joinServer(String serverId);
  Future<void> leaveServer(String serverId);
}
