import 'dart:async';

import 'package:discord_replicate/data/model/user_model.dart';
import 'package:discord_replicate/domain/model/user.dart';

abstract class Mapper<I, O> {
  FutureOr<O> map(I input);
}

class UserModelToUserMapper implements Mapper<UserModel, User> {
  @override
  FutureOr<User> map(input) {
    throw UnimplementedError();
  }
}
