import 'dart:async';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:get_it/get_it.dart';

/// Store provides basic CRUD and observe behavior.
abstract class Store<T> implements Disposable {
  /// Get item from this store matching provided id.
  /// Return null if key does not exist.
  Future<T?> load(String id);

  /// Get all item stored in this store.
  Future<List<T>> loadAll();

  /// Save item into this store.
  /// Overwrite data if item with same key already exist.
  Future<void> save(T item);

  /// Save all provided item into this store.
  /// Overwrite data if item with same key already exist.
  Future<void> saveAll(List<T> items);

  /// Delete item with provided id.
  Future<void> delete(String id);

  /// Delete all item with provided id.
  Future<void> deleteAll(List<String> ids);

  /// Check if item with provided id already exist in this store.
  Future<bool> exist(String id);

  /// Observe value if there's any changes (create/update & delete) on the entity in this store.
  ///
  /// If `id` is provided, only emit `ObservableEntityEvent` on item with provided id.
  ///
  /// If `id` not provided, emit `ObservableEntityEvent` on all item changes.
  Stream<ObservableEntityEvent<T>> observe({String? id});
}
