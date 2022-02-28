import 'dart:async';
import 'dart:collection';

import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:logger/logger.dart';

class InMemoryUserStore implements Store<User> {
  final Logger log = Logger();

  final SplayTreeMap<String, User> _cache = SplayTreeMap();

  @override
  Future<bool> exist(String id) async {
    return _cache.containsKey(id);
  }

  @override
  Future<User?> load(String id) async {
    return _cache[id];
  }

  @override
  Future<List<User>> loadAll() async {
    return _cache.values.toList();
  }

  @override
  FutureOr onDispose() async {
    log.d("Dispose in-memory user store");
    _cache.clear();
  }

  @override
  Future<void> save(User user) async {
    _cache[user.uid] = user;
  }

  @override
  Future<void> saveAll(List<User> users) async {
    var entries = users.toSplayTreeMap<String, User>(keyConverter: (e) => e.uid, valueConverter: (e) => e);
    _cache.addAll(entries);
  }

  @override
  Future<void> delete(String id) async {
    if (_cache.containsKey(id)) _cache.remove(_cache[id]);
  }
}
