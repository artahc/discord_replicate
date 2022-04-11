import 'dart:async';

import 'package:custom_extension/custom_extensions.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/application/config/injection.dart';

import 'package:discord_replicate/data/store/store.dart';

import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';

import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: ServerRepository, env: [Env.PROD, Env.DEV])
class ServerRepositoryImpl implements ServerRepository {
  final ServerRemoteApi _api;
  final Store<String, Server> _db;
  final Store<String, Server> _cache;

  ServerRepositoryImpl(
    this._api,
    @Named("DB_SERVER") this._db,
    @Named("CACHE_SERVER") this._cache,
  );

  @override
  Future<Server> getServerById(String id) async {
    var memory = LazyStream(() {
      return Future.sync(() => _cache.load(id)).asStream().where((server) => server != null).doOnData((server) {
        log.i("Server found on memory cache. $server");
      });
    });

    var local = LazyStream(
      () async => Future.sync(() => _db.load(id)).asStream().where((server) => server != null).doOnData((server) async {
        await saveServer(server!);
        log.i("Server found on local database. $server");
      }),
    );

    var remote = LazyStream(() async {
      return _api.getServerById(id).asStream().doOnData((server) async {
        await saveServer(server);
        log.i("Server retrieved from remote API. $server");
      });
    });

    var source = await ConcatStream([memory, local, remote]).firstWhere((server) => server != null);
    return source!;
  }

  @override
  Future<void> saveServer(Server server) async {
    await _db.save(server.id, server);
    await _cache.save(server.id, server);
  }

  @override
  Future<void> saveAllServers(List<Server> servers) async {
    Map<String, Server> maps = servers.toMap(keyConverter: (e) => e.id, valueConverter: (e) => e);
    await _db.saveAll(maps);
    await _cache.saveAll(maps);
  }

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }

  @override
  Future<Server> joinServer(String serverId) {
    return _api.joinServer(serverId).then((server) async {
      await _cache.save(server.id, server);
      await _db.save(server.id, server);

      return server;
    });
  }

  @override
  Future<void> leaveServer(String serverId) {
    return _api.leaveServer(serverId).whenComplete(() async {
      await _cache.delete(serverId);
      await _db.delete(serverId);
    });
  }
}
