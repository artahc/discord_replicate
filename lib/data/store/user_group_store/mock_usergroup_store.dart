import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Named("DB_USERGROUP")
@Injectable(as: Store<UserGroup>, env: [Env.TEST])
class MockHiveUserGroupStore extends Mock implements Store<UserGroup> {}

@Named("CACHE_USERGROUP")
@Injectable(as: Store<UserGroup>, env: [Env.TEST])
class MockCacheUserGroupStore extends Mock implements Store<UserGroup> {}
