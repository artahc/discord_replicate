import 'dart:async';

import 'package:discord_replicate/common/app_logger.dart';
import 'package:discord_replicate/common/app_config.dart';

import 'package:discord_replicate/data/store/store.dart';

import 'package:discord_replicate/domain/api/user_remote_api.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteApi _api;
  final Store<User> _db;
  final Store<User> _cache;

  UserRepositoryImpl({
    UserRemoteApi? api,
    Store<User>? database,
    Store<User>? cache,
  })  : _api = api ?? sl.get(),
        _db = database ?? sl.get(),
        _cache = cache ?? sl.get();

  @override
  Future<User> getUserById(String uid) async {
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
      return _api.getUserById(uid).asStream().doOnData((user) async {
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

  @override
  Future<void> saveUser(User user) async {
    var exist = await _db.exist(user.uid);
    if (!exist) throw Exception("User does not exist.");

    await _db.save(user);
    await _cache.save(user);
  }

  @override
  Stream<ObservableEntityEvent<User>> observeChanges({String? userId}) async* {
    yield* _db.observe(id: userId).doOnData((event) async {
      if (event.event == EntityEvent.DELETED)
        await _cache.delete(event.key);
      else
        await _cache.save(event.value!);
    });
  }
}
