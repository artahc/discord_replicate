import 'dart:async';

import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

mixin HiveStoreMixin<K, V> on Store<K, V> {
  String get boxName;

  @protected
  @override
  // ignore: override_on_non_overriding_member
  Future<LazyBox<V>> getBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return Hive.openLazyBox(boxName);
    } else {
      return Hive.lazyBox(boxName);
    }
  }

  @override
  FutureOr<V?> load(K key) {
    return getBox().then((box) => box.get(key));
  }

  @override
  FutureOr<Iterable<V>> loadAll() {
    return getBox().then((box) async {
      var futures = box.keys.map((key) {
        return box.get(key).then((value) => value!);
      });
      return Future.wait(futures);
    });
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
  FutureOr<int> length() {
    return getBox().then((box) => box.length);
  }

  @override
  FutureOr<void> clear() {
    return getBox().then((box) => box.clear());
  }

  @override
  FutureOr onDispose() {
    return getBox().then((box) => box.deleteFromDisk()).whenComplete(() {
      log.w("Hive database with box $boxName cleared.");
    });
  }
}
