import 'package:discord_replicate/domain/model/user.dart';

abstract class GetUserByIdUseCase {
  Future<User> invoke({required String userId});
}
