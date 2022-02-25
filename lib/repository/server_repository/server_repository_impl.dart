import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/repository/server_repository/hivedb_server_store.dart';
import 'package:discord_replicate/repository/server_repository/inmemory_server_store.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class ServerRepositoryImpl implements ServerRepository {
  final Logger log = Logger();

  final RemoteApi _api;
  final Store<Server> _db;
  final Store<Server> _cache;

  ServerRepositoryImpl({
    RemoteApi? api,
    Store<Server>? database,
    Store<Server>? cache,
  })  : _api = api ?? sl<RemoteApi>(),
        _db = database ?? sl<HiveServerStore>(),
        _cache = cache ?? sl<InMemoryServerStore>();

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
      return _api.getServer(id).asStream().doOnData((server) async {
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
}
