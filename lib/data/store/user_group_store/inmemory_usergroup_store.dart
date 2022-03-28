import 'dart:async';
import 'dart:collection';

import 'package:custom_extension/custom_extensions.dart';
import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:injectable/injectable.dart';

@Named("CACHE_USERGROUP")
@Injectable(as: Store<UserGroup>, env: [Env.PROD, Env.DEV])
class InMemoryUserGroupStore implements Store<UserGroup> {
  final SplayTreeMap<String, UserGroup> _cache = SplayTreeMap();

  @override
  Future<bool> exist(String id) async {
    return _cache.containsKey(id);
  }

  @override
  Future<UserGroup?> load(String id) async {
    return _cache[id];
  }

  @override
  Future<List<UserGroup>> loadAll() async {
    return _cache.values.toList();
  }

  @override
  FutureOr onDispose() {
    _cache.clear();
  }

  @override
  Future<void> save(UserGroup item) async {
    _cache[item.id] = item;
  }

  @override
  Future<void> saveAll(List<UserGroup> items) async {
    _cache.addAll(items.toSplayTreeMap(keyConverter: (e) => e.id, valueConverter: (e) => e));
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
  Stream<ObservableEntityEvent<UserGroup>> observe({String? id}) {
    // TODO: implement observe
    throw UnimplementedError();
  }
}
