import 'dart:async';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/repository/server_repository/server_repository.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:get_it/get_it.dart';

abstract class ServerInteractor implements Disposable {
  Future<Server> getServerById(String id);
}

class ServerInteractorImpl implements ServerInteractor {
  final ServerRepository _serverRepo;

  ServerInteractorImpl({ServerRepository? serverRepo}) : _serverRepo = serverRepo ?? sl<ServerRepository>();

  @override
  Future<Server> getServerById(String id) async {
    var server = await _serverRepo.getServer(id);
    if (server == null) throw NotFoundException("Server not found");

    return server;
  }

  @override
  FutureOr onDispose() {}
}
