import 'dart:async';

import 'package:discord_replicate/domain/model/user/user.dart';
import 'package:get_it/get_it.dart';

abstract class UserRepository implements Disposable {
  Future<User> getUserById(String uid);
  Future<void> saveUser(User user);
}
