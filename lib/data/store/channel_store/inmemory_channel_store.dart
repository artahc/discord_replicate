import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/inmemory_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:injectable/injectable.dart';

@Named("CACHE_CHANNEL")
@Injectable(as: Store<String, Channel>, env: [Env.PROD, Env.DEV])
class InMemoryChannelStore extends Store<String, Channel> with InMemoryStoreMixin {}
