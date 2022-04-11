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
}
