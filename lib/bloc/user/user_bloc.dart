import 'dart:async';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  StreamController<UserEvent> _eventStream = StreamController.broadcast();
  Stream<UserEvent> get eventStream => _eventStream.stream;

  final UserService _userService;

  final AuthBloc _authBloc;

  late Logger log = Logger();
  late StreamSubscription _authStateSubscription;

  UserBloc({
    required AuthBloc authBloc,
    UserService? userService,
  })  : _userService = userService ?? GetIt.I.get<UserService>(),
        _authBloc = authBloc,
        super(UserState.empty()) {
    on<UserEvent>((event, emit) => _handleEvent(event, emit));

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
    await _userService.getCurrentUser().then((user) {
      emit(UserState.loaded(user));
    }).catchError((error, stackTrace) {
      log.e("Error when loading user after sign-in.", error, stackTrace);
      emit(UserState.error(error));
    });
  }

  _deleteUser(emit) async {
    emit(UserState.empty());
  }

  _handleEvent(UserEvent event, emit) async {
    return await event.when(
      // loadPrivateChannels: () => _loadPrivateChannels(emit),
      loadUser: () => _loadUser(emit),
      deleteUser: () => _deleteUser(emit),
    );
  }
}
