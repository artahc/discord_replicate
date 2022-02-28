import 'dart:async';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/interactor/server/server_interactor.dart';
import 'package:discord_replicate/interactor/user/user_interactor.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/repository/auth_repository/auth_service.dart';
import 'package:discord_replicate/repository/server_repository/server_repository.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/repository/store.dart';

class ServerInteractorImpl implements ServerInteractor {
  final ServerRepository _serverRepo;

  ServerInteractorImpl({ServerRepository? serverRepo, UserInteractor? userInteractor}) : _serverRepo = serverRepo ?? sl.get();

  @override
  Future<Server> getServerById({required String id}) async {
    var server = await _serverRepo.getServer(id);
    return server;
  }

  @override
  Future<Server> joinServer(String serverId) async {
    // TODO: implement joinServer
    throw UnimplementedError();
  }

  @override
  Future<void> leaveServer(String serverId) {
    // TODO: implement leaveServer
    throw UnimplementedError();
  }
}
