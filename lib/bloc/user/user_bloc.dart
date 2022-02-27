import 'dart:async';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/interactor/user/user_interactor.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Logger log = Logger();
  final UserInteractor _userInteractor;
  final AuthBloc _authBloc;

  StreamController<UserEvent> _eventStream = StreamController.broadcast();
  Stream<UserEvent> get eventStream => _eventStream.stream;

  late StreamSubscription _authStateSubscription;

  UserBloc({
    required AuthBloc authBloc,
    UserInteractor? userInteractor,
  })  : _userInteractor = userInteractor ?? sl.get<UserInteractor>(),
        _authBloc = authBloc,
        super(UserState.empty()) {
    on<UserEvent>((event, emit) {
      return event.when(
        // loadPrivateChannels: () => _loadPrivateChannels(emit),
        loadUser: () => _loadUser(emit),
        deleteUser: () => _deleteUser(emit),
        joinServer: (String serverId) => _joinServer(serverId, emit),
        leaveServer: (String serverId) => _leaveServer(serverId, emit),
      );
    });

    _authStateSubscription = _authBloc.stream.listen((state) {
      state.whenOrNull(
        authenticated: (credential) {
          add(UserEvent.loadUser());
        },
        unauthenticated: () {
          add(UserEvent.deleteUser());
        },
      );
    });
  }

  @override
  void onEvent(UserEvent event) {
    _eventStream.sink.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    _eventStream.close();
    return super.close();
  }

  _loadUser(emit) async {
    emit(UserState.loading());
    await _userInteractor.getCurrentUser().then((user) {
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
