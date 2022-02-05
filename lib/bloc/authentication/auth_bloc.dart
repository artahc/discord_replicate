import 'dart:developer';

import 'package:discord_replicate/main.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_event.dart';
import 'package:discord_replicate/bloc/authentication/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:logger/logger.dart';

export 'auth_event.dart';
export 'auth_state.dart';

enum RegisterOptions { Phone, Email }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Logger log = Logger();
  final AuthService _authService;

  AuthBloc({AuthService? authService})
      : _authService = authService ?? GetIt.I.get<AuthService>(),
        super(AuthStateInitial()) {
    on<AuthEvent>((event, emit) => _handleEvent(event, emit));
  }

  _handleEvent(AuthEvent event, emit) {
    return event.when(
      initialEvent: () => _handleInitial(emit),
      signInEvent: (id, password) => _signIn(id, password, emit),
      signUpEvent: (option, id) => _signUp(id, option, emit),
      signOutEvent: () => _signOut(emit),
    );
  }

  _handleInitial(emit) async {
    var credential = await _authService.getCredential();
    if (credential == null)
      emit(AuthState.unauthenticated());
    else {
      emit(AuthState.authenticated(credential: credential));
    }
  }

  _signIn(String id, String password, emit) async {
    emit(AuthState.authenticating());
    await _authService.signIn(id, password).then((credential) {
      emit(AuthState.authenticated(credential: credential));
    }).onError((error, stackTrace) {
      emit(AuthState.error(exception: error as Exception));
    });
  }

  _signUp(String id, RegisterOptions option, emit) async {
    emit(AuthState.authenticating());
    switch (option) {
      case RegisterOptions.Email:
        await _authService.signUpEmail(id).then((credential) {
          log.i("Successfully signing up");
          emit(AuthState.authenticated(credential: credential));
        }).onError((error, stackTrace) {
          log.e("Error when signin up", error, stackTrace);
          emit(AuthState.error(exception: error as Exception));
        });
        break;
      case RegisterOptions.Phone:
        emit(AuthState.error(exception: Exception("Sign up with phone number is not supported yet.")));
        break;
    }
  }

  _signOut(emit) async {
    await _authService.signOut();
    await GetIt.I.reset();
    await initializeDependency();
    emit(AuthState.unauthenticated());
  }
}
