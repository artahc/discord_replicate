import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/inmemory_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:injectable/injectable.dart';

@Named("CACHE_SERVER")
@Injectable(as: Store<String, Server>, env: [Env.PROD, Env.DEV])
class InMemoryServerStore extends Store<String, Server> with InMemoryStoreMixin {}
