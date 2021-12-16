import 'dart:developer';

import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_event.dart';
import 'package:discord_replicate/bloc/authentication/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

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
  final UserRepository userRepository;

  AuthBloc({required this.authService, required this.userRepository}) : super(AuthStateInitial());

  Stream<AuthState> _handleInitial() async* {
    var credential = await authService.getCurrentUserCredential();
    if (credential == null) {
      emit(AuthState.signedOut());
    } else {
      var user = await userRepository.loadUser(credential.uid);
      emit(AuthState.signedIn(credential: credential, user: user));
    }
  }

  Stream<AuthState> _signIn(String email, String password) async* {
    var credential = await authService.signIn(email, password);
    var user = await userRepository.loadUser(credential.uid);
    log("Token ${credential.token}. \nUser $user", name: this.runtimeType.toString());
    var state = AuthState.signedIn(credential: credential, user: user);
    emit(state);
  }

  Stream<AuthState> _signUp(RegisterOptions option, String id) async* {
    switch (option) {
      case RegisterOptions.Email:
        var credential = await authService.signUpEmail(id);
        var user = await userRepository.loadUser(credential.uid);

        var state = AuthState.signedIn(credential: credential, user: user);

        emit(state);
        break;
      case RegisterOptions.Phone:
        emit(AuthState.error(exception: Exception("Sign up with phone number is not supported yet.")));
        break;
    }
  }

  Stream<AuthState> _signOut() async* {
    await authService.signOut();
    emit(AuthStateSignedOut());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    dev.log("$event received.", name: this.runtimeType.toString());

    yield* event.when(
      initialEvent: _handleInitial,
      signInEvent: _signIn,
      signUpEvent: _signUp,
      signOutEvent: _signOut,
    );
  }
}
