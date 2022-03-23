import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

abstract class GetUserByIdUseCase {
  Future<User> invoke({required String userId});
}
