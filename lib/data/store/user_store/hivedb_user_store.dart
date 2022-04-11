import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/data/store/hivedb_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:injectable/injectable.dart';

@Named("DB_USER")
@Injectable(as: Store<String, User>, env: [Env.PROD, Env.DEV])
class HiveUserStore extends Store<String, User> with HiveStoreMixin {
  @override
  String get boxName => HiveConstants.USER_BOX;
}
