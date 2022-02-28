import 'dart:async';
import 'package:get_it/get_it.dart';

/// Mixin for providing basic CRUD behaviour.
abstract class Store<T> implements Disposable {
  Future<T?> load(String id);
  Future<List<T>> loadAll();
  Future<void> save(T item);
  Future<void> saveAll(List<T> items);
  Future<void> delete(String id);
  Future<bool> exist(String id);
}
