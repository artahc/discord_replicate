import 'dart:async';
import 'package:get_it/get_it.dart';

/// Mixin for providing basic CRUD behaviour.
abstract class Store<T> implements Disposable {
  Future<T?> load(String id);
  Future<List<T>> loadAll();

  /// Save item into cache and memory.
  /// Overwrite data if already exist.
  Future<void> save(T item);
  Future<void> saveAll(List<T> items);
  Future<void> delete(String id);
  Future<void> deleteAll(List<String> ids);
  Future<bool> exist(String id);
}
