import 'package:discord_replicate/data/repository/firebase_auth_repository.dart';
import 'package:discord_replicate/domain/bloc/authentication/auth_event.dart';
import 'package:discord_replicate/domain/bloc/authentication/auth_state.dart';
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
  final AuthRepository _authService;

  AuthBloc(this._authService) : super(AuthStateInitial());

  _handleInitial() async {
    var userCredential = await _authService.getUserCurrentState();
    if (userCredential == null) {
      dev.log("User Credential not found.", name: this.runtimeType.toString());
      emit(AuthStateSignedOut());
    } else {
      dev.log("User Credential not found.", name: this.runtimeType.toString());
      emit(AuthStateSignedIn(credential: userCredential));
    }
  }

  Stream<AuthState> _signIn(String email, String password) async* {
    AuthState result = await _authService.signIn(email, password).then(
          (value) => AuthStateSignedIn(credential: value),
          onError: (e) => AuthState.error(exception: e),
        );

    dev.log("User signed in.", name: this.runtimeType.toString());
    emit(result);
  }

  Stream<AuthState> _signUp(RegisterOptions option, String id) async* {
    switch (option) {
      case RegisterOptions.Email:
        AuthState result = await _authService.signUpEmail(id).then(
              (value) => AuthStateSignedIn(credential: value),
              onError: (e) => AuthState.error(exception: e),
            );
        dev.log("Sign up result: $result", name: this.runtimeType.toString());
        emit(result);
        break;
      case RegisterOptions.Phone:
        dev.log("Sign up with phone number is not supported yet.", name: this.runtimeType.toString());
        emit(AuthState.error(exception: Exception("Sign up with phone number is not supported yet.")));
        break;
    }
  }

  Stream<AuthState> _signOut() async* {
    _authService.signOut();
    dev.log("User signed out.", name: this.runtimeType.toString());
    emit(AuthStateSignedOut());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    dev.log("$event received.", name: this.runtimeType.toString());

    event.when(
      initialEvent: _handleInitial,
      signInEvent: (id, password) async* {
        yield* _signIn(id, password);
      },
      signUpEvent: (option, id) async* {
        yield* _signUp(option, id);
      },
      signOutEvent: () async* {
        yield* _signOut();
      },
    );
  }
}
