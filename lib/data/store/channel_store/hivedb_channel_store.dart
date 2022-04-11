import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/data/store/hivedb_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/channel.dart';

import 'package:injectable/injectable.dart';

@Named("DB_CHANNEL")
@Injectable(as: Store<String, Channel>, env: [Env.PROD, Env.DEV])
class HiveChannelStore extends Store<String, Channel> with HiveStoreMixin {
  @override
  String get boxName => HiveConstants.CHANNEL_BOX;
}
