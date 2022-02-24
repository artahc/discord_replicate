import 'dart:async';
import 'package:get_it/get_it.dart';

export 'channel_repository/channel_repository.dart';
export 'server_repository/server_repository.dart';
export 'user_group_repository/user_group_repository.dart';
export 'user_repository/user_repository.dart';

/// Mixin for providing basic CRUD behaviour.
mixin Store<T> implements Disposable {
  Future<T?> load(String id);
  Future<List<T>> loadAll();
  Future<void> save(T item);
  Future<void> saveAll(List<T> items);
  Future<void> delete(String id);
  Future<bool> exist(String id);
}
