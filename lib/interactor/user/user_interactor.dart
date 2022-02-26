import 'dart:async';

import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/model/user/user.dart';

abstract class UserInteractor {
  Future<User> getCurrentUser();
  Future<Channel?> getCurrentUserRecentPrivateChannel();
  Future<Server?> getCurrentUserRecentServer();
  Future<User> getUserById(String id);
}
