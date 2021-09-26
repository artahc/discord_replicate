import 'package:discord_replicate/domain/services/firebase_auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

enum RegisterOptions { Phone, Email }

extension ParseToString on RegisterOptions {
  String value() {
    return this.toString().split('.').last;
  }
}

@immutable
abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String id;
  final String password;

  AuthSignInEvent({required this.id, required this.password});
}

class AuthSignUpEvent extends AuthEvent {
  final RegisterOptions option;
  final String id;

  AuthSignUpEvent({required this.option, required this.id});
}

class AuthSignOutEvent extends AuthEvent {}

@immutable
abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateSignedIn extends AuthState {
  final UserCredential credential;

  AuthStateSignedIn({required this.credential});
}

class AuthStateSignedOut extends AuthState {}

class AuthStateError extends AuthState {
  final Exception error;

  AuthStateError(this.error);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthStateInitial());

  Stream<AuthState> _signIn(String email, String password) async* {
    AuthState result = await _authService.signIn(email, password).then(
          (value) => AuthStateSignedIn(credential: value),
          onError: (e) => AuthStateError(e),
        );

    dev.log("User signed in.", name: this.runtimeType.toString());
    emit(result);
  }

  Stream<AuthState> _signUp(RegisterOptions option, String id) async* {
    switch (option) {
      case RegisterOptions.Email:
        AuthState result = await _authService.signUpEmail(id).then(
              (value) => AuthStateSignedIn(credential: value),
              onError: (e) => AuthStateError(e),
            );
        dev.log("Sign up result: $result", name: this.runtimeType.toString());
        // TODO : emit
        break;
      case RegisterOptions.Phone:
        dev.log("Sign up with phone number is not supported yet.", name: this.runtimeType.toString());
        emit(AuthStateError(Exception("Sign up with phone number is not supported yet.")));
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
    if (event is AuthInitialEvent) {
      var userCredential = await _authService.getUserCurrentState();
      if (userCredential == null)
        emit(AuthStateSignedOut());
      else
        emit(AuthStateSignedIn(credential: userCredential));
    } else if (event is AuthSignInEvent) {
      yield* _signIn(event.id, event.password);
    } else if (event is AuthSignUpEvent) {
      yield* _signUp(event.option, event.id);
    } else if (event is AuthSignOutEvent) {
      yield* _signOut();
    }
  }
}
