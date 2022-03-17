import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/presentation/bloc/user/user_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateProvider = StateNotifierProvider<UserController, UserState>((ref) {
  return UserController(ref);
});

final directMessageListProvider = FutureProvider((ref) {
  final userState = ref.watch(userStateProvider);
  return userState.maybeWhen(
    orElse: () => <Channel>[],
    loaded: (user) {
      return user.privateChannels.toList();
    },
  );
});

class UserController extends StateNotifier<UserState> {
  final Ref ref;

  UserController(this.ref) : super(UserState.empty());
}
