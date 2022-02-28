import 'dart:async';

import 'package:discord_replicate/model/server/server.dart';

abstract class ServerInteractor {
  Future<Server> getServerById({required String id});

  Future<Server> joinServer(String serverId);
  Future<void> leaveServer(String serverId);
}
