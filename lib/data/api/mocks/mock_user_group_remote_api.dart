import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: UserGroupRemoteApi, env: [Env.TEST])
class MockUserGroupRemoteApi extends Mock implements UserGroupRemoteApi {}
