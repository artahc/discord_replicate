import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/data/store/hivedb_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:injectable/injectable.dart';

@Named("DB_SERVER")
@Injectable(as: Store<String, Server>, env: [Env.PROD, Env.DEV])
class HiveServerStore extends Store<String, Server> with HiveStoreMixin {
  @override
  String get boxName => HiveConstants.SERVER_BOX;
}
