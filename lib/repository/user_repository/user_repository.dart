import 'dart:async';

import 'package:discord_replicate/model/user/user.dart';
import 'package:get_it/get_it.dart';

abstract class UserRepository implements Disposable {
  Future<User> getUser(String uid);
}
