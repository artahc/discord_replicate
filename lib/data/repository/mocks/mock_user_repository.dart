import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: UserRepository, env: [Env.TEST])
class MockUserRepository extends Mock implements UserRepository {}
