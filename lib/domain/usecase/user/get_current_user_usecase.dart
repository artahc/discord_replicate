import 'package:discord_replicate/domain/model/user.dart';

abstract class GetCurrentUserUseCase {
  Future<User> invoke();
}
