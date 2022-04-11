import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/inmemory_store_mixin.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:injectable/injectable.dart';

@Named("CACHE_USER")
@Injectable(as: Store<String, User>, env: [Env.PROD, Env.DEV])
class InMemoryUserStore extends Store<String, User> with InMemoryStoreMixin<String, User> {}
