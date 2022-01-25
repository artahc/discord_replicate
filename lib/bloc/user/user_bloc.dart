import 'dart:async';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  final AuthBloc _authBloc;

  late Logger log = Logger();
  late StreamSubscription _authStateSubscription;

  UserBloc({
    required AuthBloc authBloc,
    UserService? userService,
  })  : _userService = userService ?? GetIt.I.get<UserService>(),
        _authBloc = authBloc,
        super(UserState.initial()) {
    on<UserEvent>((event, emit) => _handleEvent(event, emit));

    _authStateSubscription = _authBloc.stream.listen((state) {
      state.whenOrNull(
        signedIn: (credential) {
          log.d("Load local user after sign-in.");
          add(UserEvent.loadUser());
        },
        signedOut: () {
          log.d("Delete local user after sign-out.");
          add(UserEvent.deleteUser());
        },
      );
    });
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }

  _loadLocalUser(emit) async {
    emit(UserState.loadUserInProgress());
    await _userService.getCurrentUser().then((user) {
      emit(UserState.loadUserSuccess(user));
    }).catchError((error, stackTrace) {
      log.e("Error when loading user after sign-in.", error, stackTrace);
      emit(UserState.loadUserFailed());
    });
  }

  _deleteLocalUser(emit) async {
    emit(UserState.initial());
  }

  _handleEvent(UserEvent event, emit) async {
    return await event.when(
      loadUser: () => _loadLocalUser(emit),
      deleteUser: () => _deleteLocalUser(emit),
    );
  }
}
