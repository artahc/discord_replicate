import 'dart:async';

import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:hive/hive.dart';

mixin HiveStoreMixin<K, V> on Store<K, V> {
  String get boxName;

  @override
  Future<Box<V>> getBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return Hive.openBox(boxName);
    } else {
      return Hive.box(boxName);
    }
  }

  @override
  FutureOr<V?> load(K key) {
    return getBox().then((box) => box.get(key));
  }

  @override
  FutureOr<Iterable<V>> loadAll() {
    return getBox().then((box) => box.values);
  }

  @override
  FutureOr<void> save(K key, V value) {
    return getBox().then((box) => box.put(key, value));
  }

  @override
  FutureOr<void> saveAll(Map<K, V> values) {
    return getBox().then((box) {
      return box.putAll(values);
    });
  }

  @override
  FutureOr<void> delete(K key) {
    return getBox().then((box) => box.delete(key));
  }

  @override
  FutureOr<void> deleteAll(Iterable<K> keys) {
    return getBox().then((box) => box.deleteAll(keys));
  }

  @override
  FutureOr<bool> exist(K key) {
    return getBox().then((box) => box.containsKey(key));
  }

  @override
  Stream<ObservableEntityEvent<K, V>> observe({K? key}) async* {
    yield* getBox().asStream().asyncExpand((box) {
      return box.watch(key: key).map((event) {
        var e = event.deleted ? EntityEvent.DELETED : EntityEvent.CREATED_OR_UPDATED;
        return ObservableEntityEvent<K, V>(e, event.key, event.value);
      });
    });
  }

  @override
  FutureOr onDispose() {
    return getBox().then((box) => box.deleteFromDisk()).whenComplete(() {
      log.w("Hive database with box $boxName cleared.");
    });
  }
}
