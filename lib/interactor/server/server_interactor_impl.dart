import 'dart:async';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/interactor/server/server_interactor.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/repository/server_repository/server_repository.dart';
import 'package:discord_replicate/app_config.dart';

class ServerInteractorImpl implements ServerInteractor {
  final ServerRepository _serverRepo;

  ServerInteractorImpl({ServerRepository? serverRepo}) : _serverRepo = serverRepo ?? sl.get();

  @override
  Future<Server> getServerById(String id) async {
    var server = await _serverRepo.getServer(id);
    if (server == null) throw NotFoundException("Server not found");

    return server;
  }
}
