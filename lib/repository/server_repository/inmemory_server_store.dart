import 'dart:async';
import 'dart:collection';

import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/repository/store.dart';

class InMemoryServerStore implements Store<Server> {
  final SplayTreeMap<String, Server> _cache = new SplayTreeMap();

  @override
  Future<bool> exist(String id) async {
    return _cache.containsKey(id);
  }

  @override
  Future<Server?> load(String id) async {
    return _cache[id];
  }

  @override
  Future<List<Server>> loadAll() async {
    return _cache.values.toList();
  }

  @override
  FutureOr onDispose() async {
    return _cache.clear();
  }

  @override
  Future<void> save(Server item) async {
    _cache[item.id] = item;
  }

  @override
  Future<void> saveAll(List<Server> items) async {
    _cache.addAll(items.toSplayTreeMap(keyConverter: (e) => e.id, valueConverter: (e) => e));
  }

  @override
  Future<void> delete(String id) async {
    if (_cache.containsKey(id)) _cache.remove(_cache[id]);
  }
}
