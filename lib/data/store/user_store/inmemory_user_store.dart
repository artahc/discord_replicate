import 'dart:async';
import 'dart:collection';

import 'package:discord_replicate/common/app_extension.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';

class InMemoryUserStore implements Store<User> {
  final SplayTreeMap<String, User> _cache = SplayTreeMap();
  late StreamController<ObservableEntityEvent<User>> _stream;
  Sink<ObservableEntityEvent<User>> get _notifier => _stream.sink;

  InMemoryUserStore() {
    _stream = StreamController.broadcast();
  }

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
    _cache.clear();
    // _stream.close();
  }

  @override
  Future<void> save(User user) async {
    _cache[user.uid] = user;
    _notifier.add(ObservableEntityEvent<User>(EntityEvent.CREATED_OR_UPDATED, user.uid, user));
  }

  @override
  Future<void> saveAll(List<User> users) async {
    var entries = users.toSplayTreeMap<String, User>(keyConverter: (e) => e.uid, valueConverter: (e) => e);
    _cache.addAll(entries);
    entries.forEach((key, value) {
      _notifier.add(ObservableEntityEvent<User>(EntityEvent.CREATED_OR_UPDATED, key, value));
    });
  }

  @override
  Future<void> delete(String id) async {
    if (_cache.containsKey(id)) {
      _cache.remove(_cache[id]);
      _notifier.add(ObservableEntityEvent<User>(EntityEvent.DELETED, id, null));
    }
  }

  @override
  Future<void> deleteAll(List<String> ids) async {
    _cache.removeWhere((key, value) => ids.contains(key));
    ids.forEach((key) {
      _notifier.add(ObservableEntityEvent<User>(EntityEvent.DELETED, key, null));
    });
  }

  @override
  Stream<ObservableEntityEvent<User>> observe({String? id}) async* {
    yield* _stream.stream.where((event) {
      if (id == null)
        return true;
      else
        return event.key == id;
    });
  }
}
