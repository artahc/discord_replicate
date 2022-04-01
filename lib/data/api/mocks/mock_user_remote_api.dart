import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/api/user_remote_api.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: UserRemoteApi, env: [Env.TEST])
class MockUserRemoteApi extends Mock implements UserRemoteApi {}
