import 'package:discord_replicate/exception/mixin_error_mapper.dart';

abstract class Repository<T> with ExceptionMapperMixin {
  Future<T> load(String id);
  Future<void> save(T item);
}
