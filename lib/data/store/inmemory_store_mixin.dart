import 'dart:async';
import 'dart:collection';

import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';

mixin InMemoryStoreMixin<K, V> on Store<K, V> {
  final SplayTreeMap<K, V> _cache = SplayTreeMap();

  final StreamController<ObservableEntityEvent<K, V>> _controller = StreamController.broadcast();
  Stream<ObservableEntityEvent<K, V>> get stream => _controller.stream;
  Sink<ObservableEntityEvent<K, V>> get notifier => _controller.sink;

  @override
  FutureOr<V?> load(K key) {
    return _cache[key];
  }

  @override
  FutureOr<Iterable<V>> loadAll() {
    return _cache.values;
  }

  @override
  FutureOr<void> save(K key, V value) {
    _cache[key] = value;
    notifier.add(ObservableEntityEvent<K, V>(EntityEvent.CREATED_OR_UPDATED, key, value));
  }

  @override
  FutureOr<void> saveAll(Map<K, V> values) {
    List<MapEntry<K, V>> entries = List.empty(growable: true);
    for (var element in values.entries) {
      entries.add(MapEntry(element.key, element.value));
    }

    _cache.addEntries(entries);

    values.forEach((key, value) {
      notifier.add(ObservableEntityEvent<K, V>(EntityEvent.CREATED_OR_UPDATED, key, value));
    });
  }

  @override
  FutureOr<void> delete(K key) {
    if (_cache.containsKey(key)) {
      _cache.removeWhere((k, _) => k == key);
      notifier.add(ObservableEntityEvent<K, V>(EntityEvent.DELETED, key, null));
    }
  }

  @override
  FutureOr<void> deleteAll(Iterable<K> keys) {
    _cache.removeWhere((key, value) => keys.contains(key));
    for (var key in keys) {
      notifier.add(ObservableEntityEvent<K, V>(EntityEvent.DELETED, key, null));
    }
  }

  @override
  FutureOr<bool> exist(K key) {
    return _cache.containsKey(key);
  }

  @override
  Stream<ObservableEntityEvent<K, V>> observe({K? key}) async* {
    yield* stream.where((event) {
      if (key == null) {
        return true;
      } else {
        return event.key == key;
      }
    });
  }

  @override
  FutureOr onDispose() async {
    _cache.clear();
    _controller.close();
  }
}
