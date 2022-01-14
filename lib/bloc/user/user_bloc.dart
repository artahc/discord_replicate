import 'dart:async';
import 'dart:developer';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/repository/auth_service.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthService _authService;
  final UserRepository _userRepo;
  final ServerRepository _serverRepo;

  final AuthBloc _authBloc;

  late StreamSubscription _authStateSubscription;

  UserBloc({
    required UserRepository userRepo,
    required AuthService authService,
    required ServerRepository serverRepo,
    required AuthBloc authBloc,
  })  : _authService = authService,
        _userRepo = userRepo,
        _serverRepo = serverRepo,
        _authBloc = authBloc,
        super(UserState.initial()) {
    on<UserEvent>((event, emit) => _handleEvent(event, emit));

    _authStateSubscription = _authBloc.stream.listen((state) {
      state.whenOrNull(
        signedIn: (credential) {
          log("Load local user after sign-in", name: runtimeType.toString());
          add(UserEvent.loadLocalUser());
        },
        signedOut: () {
          log("Delete local user after sign-out", name: runtimeType.toString());
          add(UserEvent.deleteLocalUser());
        },
      );
    });
  }

  @override
  void onEvent(UserEvent event) {
    return super.onEvent(event);
  }

  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }

  _loadLocalUser(emit) async {
    emit(UserState.loadUserInProgress());
    var credential = await _authService.getCredential(forceRefresh: true);
    if (credential == null)
      emit(UserState.loadUserFailed());
    else {
      await _userRepo.load(credential.uid).then((user) async {
        if (user.servers.isNotEmpty) await _serverRepo.saveAll(user.servers);
        emit(UserState.loadUserSuccess(user));
      }).catchError((e) {
        log("Error when loading user after sign-in.", name: runtimeType.toString());
        emit(UserState.loadUserFailed());
      });
    }
  }

  _deleteLocalUser(emit) async {
    emit(UserState.initial());
  }

  _loadUser(String uid, emit) async {}

  _handleEvent(UserEvent event, emit) async {
    return await event.when(
      loadLocalUser: () => _loadLocalUser(emit),
      deleteLocalUser: () => _deleteLocalUser(emit),
      loadUser: (String uid) => _loadUser(uid, emit),
    );
  }
}
