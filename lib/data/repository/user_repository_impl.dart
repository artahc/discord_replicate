import 'dart:async';

import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/application/config/injection.dart';

import 'package:discord_replicate/data/store/store.dart';

import 'package:discord_replicate/domain/api/user_remote_api.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: UserRepository, env: [Env.PROD, Env.DEV])
class UserRepositoryImpl implements UserRepository {
  final UserRemoteApi _api;
  final Store<String, User> _db;
  final Store<String, User> _cache;

  UserRepositoryImpl(
    this._api,
    @Named("DB_USER") this._db,
    @Named("CACHE_USER") this._cache,
  );

  @override
  Future<User> getUserById(String uid) async {
    var memory = LazyStream(() {
      return Future.sync(() => _cache.load(uid)).asStream().where((user) => user != null).doOnData((user) {
        log.i("User found on memory cache. $user");
      });
    });

    var local = LazyStream(() {
      return Future.sync(() => _db.load(uid)).asStream().where((user) => user != null).doOnData((user) async {
        await saveUser(user!);
        log.i("User found on local database. $user");
      });
    });

    var remote = LazyStream(() {
      return _api.getUserById(uid).asStream().doOnData((user) async {
        await saveUser(user);
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
    await _db.save(user.uid, user);
    await _cache.save(user.uid, user);
  }

  @override
  Stream<ObservableEntityEvent<String, User>> observeChanges({String? userId}) async* {
    yield* _db.observe(key: userId).doOnData((event) async {
      if (event.event == EntityEvent.DELETED) {
        await _cache.delete(event.key);
      } else {
        await _cache.save(event.key, event.value!);
      }
    });
  }
}
