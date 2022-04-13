import 'dart:async';

import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:get_it/get_it.dart';

/// Store provides basic CRUD and observe interface.
abstract class Store<K, T> implements Disposable {
  FutureOr<bool> isEmpty();
  FutureOr<int> length();

  /// Get item from this store matching provided id.
  ///
  /// Return null if key does not exist.
  FutureOr<T?> load(K key);

  /// Get all item stored in this store.
  FutureOr<Iterable<T>> loadAll();

  /// Save item into this store.
  ///
  /// Overwrite data if item with same key already exist.
  FutureOr<void> save(K key, T value);

  /// Save all provided item into this store.
  ///
  /// Overwrite data if item with same key already exist.
  FutureOr<void> saveAll(Map<K, T> entries);

  /// Delete item with provided id.
  FutureOr<void> delete(K key);

  /// Delete all item with provided id.
  FutureOr<void> deleteAll(Iterable<K> keys);

  /// Check if item with provided id already exist in this store.
  FutureOr<bool> exist(K key);

  FutureOr<void> clear();

  /// Observe value if there's any changes (create/update & delete) on the entity in this store.
  ///
  /// If `key` is provided, only emit `ObservableEntityEvent` on item with provided id.
  ///
  /// If `key` not provided, emit `ObservableEntityEvent` on all item changes.
  Stream<ObservableEntityEvent<K, T>> observe({K? key});
}
