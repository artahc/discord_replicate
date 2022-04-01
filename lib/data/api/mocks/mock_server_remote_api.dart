import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: ServerRemoteApi, env: [Env.TEST])
class MockServerRemoteApi extends Mock implements ServerRemoteApi {}
