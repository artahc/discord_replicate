import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: AuthRepository, env: [Env.TEST])
class MockAuthRepository extends Mock implements AuthRepository {}
