import 'dart:async';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthService _authService;
  final UserRepository _userRepo;
  final ServerRepository _serverRepo;

  final AuthBloc _authBloc;

  late Logger log = Logger();
  late StreamSubscription _authStateSubscription;

  UserBloc({
    required AuthBloc authBloc,
    UserRepository? userRepo,
    AuthService? authService,
    ServerRepository? serverRepo,
  })  : _authService = authService ?? GetIt.I.get<AuthService>(),
        _userRepo = userRepo ?? GetIt.I.get<UserRepository>(),
        _serverRepo = serverRepo ?? GetIt.I.get<ServerRepository>(),
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
        user.servers.forEach((element) async {
          await _serverRepo.save(element);
        });
        // if (user.servers.isNotEmpty) await _serverRepo.saveAll(user.servers);
        _userRepo.setCurrentUser(user);
        emit(UserState.loadUserSuccess(user));
      }).catchError((e, st) {
        log.e("Error when loading user after sign-in.", e, st);
        emit(UserState.loadUserFailed());
      });
    }
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
