import 'dart:async';

import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'direct_message_event.dart';
import 'direct_message_state.dart';

export 'direct_message_event.dart';
export 'direct_message_state.dart';

@Injectable()
class DirectMessageBloc extends Bloc<DirectMessageEvent, DirectMessageState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  final StreamController<DirectMessageEvent> _eventStream = StreamController.broadcast();
  Stream<DirectMessageEvent> get eventStream => _eventStream.stream;

  late StreamSubscription _userStateSubscription;

  DirectMessageBloc(
    @factoryParam Stream<UserState> userStateStream,
    this._getCurrentUserUseCase,
  ) : super(const DirectMessageState.empty()) {
    on<DirectMessageEvent>((event, emit) async {
      await event.when(
        loadRecent: () => _loadRecent(emit),
      );
    });

    _userStateSubscription = userStateStream.listen((state) {
      state.whenOrNull(
        loaded: (user) {
          if (user.privateChannels.isNotEmpty) add(const DirectMessageEvent.loadRecent());
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
    emit(const DirectMessageState.loading());
    await _getCurrentUserUseCase.invoke().then((user) {
      if (user.privateChannels.isEmpty) {
        emit(const DirectMessageState.empty());
      } else {
        emit(DirectMessageState.loaded(user.privateChannels.first));
      }
    });
  }
}
