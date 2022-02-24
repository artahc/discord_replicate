import 'dart:async';

import 'package:discord_replicate/model/user/user.dart';

abstract class UserRepository {
  Future<User> getUser(String uid);
}

