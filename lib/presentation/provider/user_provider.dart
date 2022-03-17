import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserProvider = StateNotifierProvider((ref) {
  return CurrentUserNotifier();
});

class CurrentUserNotifier extends StateNotifier<User> {
  CurrentUserNotifier() : super(User(uid: "uid", name: "name", avatarUrl: "avatarUrl", about: "about"));

  Future updateProfile(User user) async {
    state = user;
  }
}

final directMessagesProvider = StateNotifierProvider((ref) {
  return DirectMessagesController();
});

class DirectMessagesController extends StateNotifier<List<Channel>> {
  DirectMessagesController() : super([]);

  Future<void> loadDirectMessages(String channelId) async {}
}
