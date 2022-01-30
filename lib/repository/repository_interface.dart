import 'package:discord_replicate/exception/mixin_error_mapper.dart';

abstract class Repository<T> with ExceptionMapperMixin {
  Future<T?> load(String id);
  Future<List<T>> loadAll();
  Future<void> save(T item);
  Future<void> saveAll(List<T> items);
}
