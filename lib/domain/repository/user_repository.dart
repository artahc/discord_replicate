import 'dart:async';

import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user/user.dart';
import 'package:get_it/get_it.dart';

abstract class UserRepository implements Disposable {
  Future<User> getUserById(String userId);
  Future<void> saveUser(User user);
  Stream<ObservableEntityEvent<User>> observeChanges({String? userId});
}
