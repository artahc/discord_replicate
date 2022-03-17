import 'dart:async';
import 'dart:collection';

import 'package:discord_replicate/application/extensions/app_extension.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';

class InMemoryChannelStore implements Store<Channel> {
  final SplayTreeMap<String, Channel> _cache = new SplayTreeMap();

  @override
  Future<Channel?> load(String id) async {
    return _cache[id];
  }

  @override
  Future<List<Channel>> loadAll() async {
    return _cache.values.toList();
  }

  @override
  Future<void> save(Channel item) async {
    _cache[item.id] = item;
  }

  @override
  Future<void> saveAll(List<Channel> items) async {
    _cache.addAll(items.toSplayTreeMap(keyConverter: (e) => e.id, valueConverter: (e) => e));
  }

  @override
  Future<bool> exist(String id) async {
    return _cache.containsKey(id);
  }

  @override
  FutureOr onDispose() async {
    _cache.clear();
  }

  @override
  Future<void> delete(String id) async {
    if (_cache.containsKey(id)) _cache.remove(_cache[id]);
  }

  @override
  Future<void> deleteAll(List<String> ids) async {
    _cache.removeWhere((key, value) => ids.contains(key));
  }

  @override
  Stream<ObservableEntityEvent<Channel>> observe({String? id}) {
    // TODO: implement observe
    throw UnimplementedError();
  }
}
