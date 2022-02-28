import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/repository/user_repository/hivedb_user_store.dart';
import 'package:discord_replicate/repository/user_repository/inmemory_user_store.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class UserRepositoryImpl implements UserRepository {
  late Logger log = Logger();

  final RemoteApi _api;
  final Store<User> _db;
  final Store<User> _cache;
  final SomethingStore store = sl.get();

  UserRepositoryImpl({
    RemoteApi? api,
    Store<User>? database,
    Store<User>? cache,
  })  : _api = api ?? sl.get<RemoteApi>(),
        _db = database ?? sl.get<HiveUserStore>(),
        _cache = cache ?? sl.get<InMemoryUserStore>();

  @override
  Future<User> getUser(String uid) async {
    var memory = LazyStream(() {
      return _cache.load(uid).asStream().where((user) => user != null).doOnData((user) {
        log.i("User found on memory cache. $user");
      });
    });

    var local = LazyStream(() {
      return _db.load(uid).asStream().where((user) => user != null).doOnData((user) async {
        await _cache.save(user!);
        log.i("User found on local database. $user");
      });
    });

    var remote = LazyStream(() {
      return _api.getUser(uid).asStream().doOnData((user) async {
        await _db.save(user);
        await _cache.save(user);
        log.i("User retrieved from remote API. $user");
      });
    });

    var result = await ConcatStream([memory, local, remote]).firstWhere((element) => element != null);
    return result!;
  }

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }
}
