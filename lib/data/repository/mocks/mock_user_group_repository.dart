import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: UserGroupRepository, env: [Env.TEST])
class MockUserGroupRepository extends Mock implements UserGroupRepository {}
