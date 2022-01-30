import 'dart:async';

import 'package:discord_replicate/bloc/direct_message/direct_message_event.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_state.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

export 'direct_message_event.dart';
export 'direct_message_state.dart';

class DirectMessageBloc extends Bloc<DirectMessageEvent, DirectMessageState> {
  final UserBloc _userBloc;
  final UserService _userService;

  final StreamController<DirectMessageEvent> _eventStream = StreamController.broadcast();
  Stream<DirectMessageEvent> get eventStream => _eventStream.stream;

  late StreamSubscription _userStateSubscription;

  DirectMessageBloc({required UserBloc userBloc, UserService? userService})
      : _userService = userService ?? GetIt.I.get<UserService>(),
        _userBloc = userBloc,
        super(DirectMessageState.empty()) {
    on<DirectMessageEvent>((event, emit) => _handleEvent(event, emit));

    _userBloc.state.whenOrNull(
      loaded: (user) {
        if (user.privateChannels.isNotEmpty) add(DirectMessageEvent.loadRecent());
      },
    );

    _userStateSubscription = userBloc.stream.listen((event) {
      event.whenOrNull(
        loaded: (user) {
          if (user.privateChannels.isNotEmpty) add(DirectMessageEvent.loadRecent());
        },
      );
    });
  }

  @override
  void onEvent(DirectMessageEvent event) {
    _eventStream.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() async {
    _eventStream.close();
    _userStateSubscription.cancel();
    super.close();
  }

  _loadRecent(emit) async {
    emit(DirectMessageState.loading());
    var channel = await _userService.getCurrentUserRecentPrivateChannel();
    if (channel == null)
      emit(DirectMessageState.empty());
    else
      emit(DirectMessageState.loaded(channel));
  }

  _handleEvent(DirectMessageEvent event, emit) async {
    return await event.when(
      loadRecent: () => _loadRecent(emit),
    );
  }
}
