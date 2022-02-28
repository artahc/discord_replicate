import 'package:discord_replicate/domain/model/user/user.dart';

abstract class UserRemoteApi {
  Future<User> getUserById(String userId);
}
