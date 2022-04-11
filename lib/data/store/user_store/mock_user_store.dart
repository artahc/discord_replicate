import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Named("DB_USER")
@Injectable(as: Store<String, User>, env: [Env.TEST])
class MockHiveUserStore extends Mock implements Store<String, User> {}

@Named("CACHE_USER")
@Injectable(as: Store<String, User>, env: [Env.TEST])
class MockCacheUserStore extends Mock implements Store<String, User> {}
