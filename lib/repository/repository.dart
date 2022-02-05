import 'package:discord_replicate/exception/mixin_error_mapper.dart';

export 'channel_repository/channel_repository.dart';
export 'server_repository/server_repository.dart';
export 'user_group_repository/user_group_repository.dart';
export 'user_repository/user_repository.dart';

abstract class Repository<T> with ExceptionMapperMixin {
  Future<T?> load(String id);
  Future<List<T>> loadAll();
  Future<void> save(T item);
  Future<void> saveAll(List<T> items);

  Future<void> dispose();
}
