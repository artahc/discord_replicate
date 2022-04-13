import 'dart:async';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/data/store/hivedb_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:injectable/injectable.dart';

@Named("DB_USERGROUP")
@Injectable(as: Store<String, UserGroup>, env: [Env.PROD, Env.DEV])
class HiveUserGroupStore extends Store<String, UserGroup> with HiveStoreMixin {
  @override
  String get boxName => HiveConstants.USER_GROUP_BOX;

  @override
  FutureOr<void> save(String key, UserGroup value) async {
    return getBox().then((box) async {
      if (!box.containsKey(key)) {
        await box.put(key, value);
      } else {
        var existingUserGroup = await box.get(key);
        var updatedMembers = Map.of(existingUserGroup!.members)..addAll(value.members);
        await box.put(key, existingUserGroup.copyWith(members: updatedMembers));
      }
    });
  }

  @override
  FutureOr<void> saveAll(Map<String, UserGroup> values) async {
    return getBox().then((box) async {
      for (var entry in values.entries) {
        if (!box.containsKey(entry.key)) {
          await box.put(entry.key, entry.value);
        } else {
          var existingUserGroup = await box.get(entry.key);
          var updatedMembers = Map.of(existingUserGroup!.members)..addAll(entry.value.members);
          await box.put(entry.key, existingUserGroup.copyWith(members: updatedMembers));
        }
      }
    });
  }
}
