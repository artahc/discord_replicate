import 'dart:async';
import 'dart:collection';

import 'package:discord_replicate/common/config/app_config.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

class Api {
  Future<User> getUserById(String id) {
    return Future.delayed(Duration(seconds: 3)).then((e) => User(uid: id, name: "name", avatarUrl: "avatarUrl", about: "about"));
  }
}

class DbStore {
  Future<Box<User>> _getBox() async {
    if (Hive.isBoxOpen('dummy'))
      return Hive.box<User>('dummy');
    else
      return await Hive.openBox<User>('dummy');
  }

  Future<User?> getUserById(String id) async {
    var box = await _getBox();
    return box.get(id);
  }

  Future<void> saveUser(User user) async {
    var box = await _getBox();
    return box.put(user.uid, user);
  }

  Stream<ObservableEntityEvent<User>> observeUser({String? id}) async* {
    var box = await _getBox();

    yield* box.watch(key: id).map((event) {
      var e = event.deleted ? EntityEvent.DELETED : EntityEvent.CREATED_OR_UPDATED;
      return ObservableEntityEvent<User>(e, event.key, event.value);
    });
  }

  Future<void> dispose() async {
    var box = await _getBox();
    await box.deleteFromDisk();
  }
}

class CacheStore {
  HashMap<String, User> cache = HashMap();

  Future<User?> getUserById(String id) async {
    return cache[id];
  }

  Future<void> saveUser(User user) async {
    cache[user.uid] = user;
  }

  Future<void> dispose() async {
    cache.clear();
  }
}

class RxRepository {
  Api api;
  DbStore db;
  CacheStore cache;

  RxRepository(this.api, this.db, this.cache);

  Future<User> getUserById(String id) async {
    var result = await Rx.concat([
      cache.getUserById(id).asStream().where((user) => user != null),
      db.getUserById(id).asStream().where((user) => user != null).doOnData((user) async {
        await cache.saveUser(user!);
      }),
      api.getUserById(id).asStream().doOnData((user) async {
        await cache.saveUser(user);
        await db.saveUser(user);
      }),
    ]).firstWhere((element) => element != null);

    return result!;
  }

  Stream<ObservableEntityEvent<User>> observe({String? id}) async* {
    yield* db.observeUser(id: id);
  }

  Future<void> dispose() async {
    await cache.dispose();
    await db.dispose();
  }
}

void main() async {
  await AppConfiguration.initHive();
  var repo = RxRepository(Api(), DbStore(), CacheStore());

  setUp(() async {
    await repo.dispose().then((value) => print("Disposed"));
  });

  tearDown(() async {
    await repo.dispose().then((value) => print("Disposed"));
  });

  test("Get data that doesnt exist on local db or cache. Should emit ObservableEntity.", () async {
    repo.observe(id: "someid").listen((event) {
      print("Observed $event");
    });

    await repo.getUserById("someid").then((value) {
      print("Anjay $value");
    });
  });
}
