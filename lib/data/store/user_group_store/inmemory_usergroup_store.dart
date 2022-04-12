import 'dart:async';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/inmemory_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:injectable/injectable.dart';

@Named("CACHE_USERGROUP")
@Injectable(as: Store<String, UserGroup>, env: [Env.PROD, Env.DEV])
class InMemoryUserGroupStore extends Store<String, UserGroup> with InMemoryStoreMixin {
  @override
  FutureOr<void> save(String key, UserGroup value) async {
    if (!cache.containsKey(key)) {
      cache[key] = value;
    } else {
      cache[key]!.members.addAll(value.members);
    }
  }

  @override
  FutureOr<void> saveAll(Map<String, UserGroup> values) async {
    values.forEach((key, value) {
      if (!cache.containsKey(key)) {
        cache[key] = value;
      } else {
        cache[key]!.members.addAll(value.members);
      }
    });
  }
}
