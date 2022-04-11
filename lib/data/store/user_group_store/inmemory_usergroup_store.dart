import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/inmemory_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:injectable/injectable.dart';

@Named("CACHE_USERGROUP")
@Injectable(as: Store<String, UserGroup>, env: [Env.PROD, Env.DEV])
class InMemoryUserGroupStore extends Store<String, UserGroup> with InMemoryStoreMixin {
  @override
  Future<void> save(String key, UserGroup value) async {}
}
