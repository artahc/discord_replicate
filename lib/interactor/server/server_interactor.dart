import 'dart:async';

import 'package:discord_replicate/model/server/server.dart';

abstract class ServerInteractor {
  Future<Server> getServerById(String id);
}
