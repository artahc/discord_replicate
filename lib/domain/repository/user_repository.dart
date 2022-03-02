import 'dart:async';

import 'package:discord_replicate/domain/model/user/user.dart';
import 'package:get_it/get_it.dart';

abstract class UserRepository implements Disposable {
  Future<User> getUser(String uid);
  Future<void> updateUser(User user);
}
