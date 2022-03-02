import 'dart:async';

import 'package:discord_replicate/common/app_logger.dart';
import 'package:discord_replicate/common/app_config.dart';

import 'package:discord_replicate/data/store/store.dart';

import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:discord_replicate/domain/model/server/server.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';

import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';

class ServerRepositoryImpl implements ServerRepository {
  final ServerRemoteApi _api;
  final Store<Server> _db;
  final Store<Server> _cache;

  ServerRepositoryImpl({
    ServerRemoteApi? api,
    Store<Server>? database,
    Store<Server>? cache,
  })  : _api = api ?? sl.get(),
        _db = database ?? sl.get(),
        _cache = cache ?? sl.get();

  @override
  Future<Server> getServer(String id) async {
    var memory = LazyStream(() {
      return _cache.load(id).asStream().where((server) => server != null).doOnData((server) {
        log.i("Server found on memory cache. $server");
      });
    });

    var local = LazyStream(
      () async => _db.load(id).asStream().where((server) => server != null).doOnData((server) async {
        await _cache.save(server!);
        log.i("Server found on local database. $server");
      }),
    );

    var remote = LazyStream(() async {
      return _api.getServerById(id).asStream().doOnData((server) async {
        await _db.save(server);
        await _cache.save(server);
        log.i("Server retrieved from remote API. $server");
      });
    });

    var source = await ConcatStream([memory, local, remote]).firstWhere((server) => server != null);
    return source!;
  }

  @override
  Future saveServer(Server server) async {
    await _db.save(server);
    await _cache.save(server);
  }

  @override
  Future saveServers(List<Server> servers) async {
    await _db.saveAll(servers);
    await _cache.saveAll(servers);
  }

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }

  @override
  Future<Server> joinServer({required String userId, required String serverId}) {
    // TODO: implement joinServer
    throw UnimplementedError();
  }

  @override
  Future<Server> leaveServer({required String userId, required String serverId}) {
    // TODO: implement leaveServer
    throw UnimplementedError();
  }
}