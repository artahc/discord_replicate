import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: ServerRepository, env: [Env.TEST])
class MockServerRepository extends Mock implements ServerRepository {}
