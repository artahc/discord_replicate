import 'dart:async';

import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/common/app_logger.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'user_event.dart';
import 'user_state.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  StreamController<UserEvent> _eventStream = StreamController.broadcast();
  Stream<UserEvent> get eventStream => _eventStream.stream;

  CompositeSubscription _subscriptions = CompositeSubscription();

  // late StreamSubscription _authStateSubscription;

  // Use Cases
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  UserBloc({
    required Stream<AuthState> authStateStream,
    GetCurrentUserUseCase? getCurrentUserUseCase,
  })  : _getCurrentUserUseCase = getCurrentUserUseCase ?? sl.get(),
        super(UserState.empty()) {
    on<UserEvent>((event, emit) {
      return event.when(
        loadUser: () => _loadUser(emit),
        deleteUser: () => _deleteUser(emit),
      );
    });

    authStateStream.listen((state) {
      state.whenOrNull(
        authenticated: (credential) {
          add(UserEvent.loadUser());
        },
        unauthenticated: () {
          add(UserEvent.deleteUser());
        },
      );
    }).addTo(_subscriptions);
  }

  @override
  void onEvent(UserEvent event) {
    _eventStream.sink.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() {
    _subscriptions.cancel();
    _eventStream.close();
    return super.close();
  }

  _loadUser(emit) async {
    emit(UserState.loading());
    await _getCurrentUserUseCase.invoke().then((user) {
      emit(UserState.loaded(user));
    }).catchError((error, stackTrace) {
      log.e("Error when loading user after sign-in.", error, stackTrace);
      emit(UserState.error(error));
    });
  }

  _deleteUser(emit) async {
    emit(UserState.empty());
  }

  _joinServer(String serverId, emit) async {}

  _leaveServer(String serverId, emit) async {}
}
