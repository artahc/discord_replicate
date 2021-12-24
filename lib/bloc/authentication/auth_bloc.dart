import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/repository/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_event.dart';
import 'package:discord_replicate/bloc/authentication/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

import 'package:hive/hive.dart';

export 'auth_event.dart';
export 'auth_state.dart';

enum RegisterOptions { Phone, Email }

extension ParseToString on RegisterOptions {
  String value() {
    return this.toString().split('.').last;
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  final UserRepository userRepo;

  AuthBloc({required this.authService, required this.userRepo}) : super(AuthStateInitial());

  Stream<AuthState> _handleInitial() async* {
    var credential = await authService.getCurrentUserCredential();
    if (credential == null) {
      emit(AuthState.signedOut());
    } else {
      emit(AuthState.signedIn(credential: credential));
    }
  }

  Stream<AuthState> _signIn(String email, String password) async* {
    emit(AuthState.signingIn());
    var credential = await authService.signIn(email, password);
    emit(AuthState.signedIn(credential: credential));
  }

  Stream<AuthState> _signUp(RegisterOptions option, String id) async* {
    switch (option) {
      case RegisterOptions.Email:
        var credential = await authService.signUpEmail(id);
        var state = AuthState.signedIn(credential: credential);

        emit(state);
        break;
      case RegisterOptions.Phone:
        emit(AuthState.error(exception: Exception("Sign up with phone number is not supported yet.")));
        break;
    }
  }

  Stream<AuthState> _signOut() async* {
    await authService.signOut();
    await Hive.deleteFromDisk();
    emit(AuthState.signedOut());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield* event.when(
      initialEvent: _handleInitial,
      signInEvent: _signIn,
      signUpEvent: _signUp,
      signOutEvent: _signOut,
    );
  }
}
