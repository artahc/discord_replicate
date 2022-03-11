import 'dart:async';

import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';
import 'package:discord_replicate/common/config/app_config.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'direct_message_event.dart';
import 'direct_message_state.dart';

export 'direct_message_event.dart';
export 'direct_message_state.dart';

class DirectMessageBloc extends Bloc<DirectMessageEvent, DirectMessageState> {
  final UserBloc _userBloc;

  final StreamController<DirectMessageEvent> _eventStream = StreamController.broadcast();
  Stream<DirectMessageEvent> get eventStream => _eventStream.stream;

  late StreamSubscription _userStateSubscription;

  // Use Cases
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  DirectMessageBloc({required UserBloc userBloc, GetCurrentUserUseCase? getCurrentUserUseCase})
      : _userBloc = userBloc,
        _getCurrentUserUseCase = getCurrentUserUseCase ?? sl.get(),
        super(DirectMessageState.empty()) {
    on<DirectMessageEvent>((event, emit) {
      return event.when(
        loadRecent: () => _loadRecent(emit),
      );
    });
 
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
    await _getCurrentUserUseCase.invoke().then((user) {
      if (user.privateChannels.isEmpty)
        emit(DirectMessageState.empty());
      else
        emit(DirectMessageState.loaded(user.privateChannels.first));
    });
  }
}
