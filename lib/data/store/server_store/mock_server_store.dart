import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Named("DB_SERVER")
@Injectable(as: Store<Server>, env: [Env.TEST])
class MockHiveServerStore extends Mock implements Store<Server> {}

@Named("CACHE_SERVER")
@Injectable(as: Store<Server>, env: [Env.TEST])
class MockCacheServerStore extends Mock implements Store<Server> {}
