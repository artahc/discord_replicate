import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';

abstract class GetCurrentUserUseCase {
  Future<User> invoke();
}
