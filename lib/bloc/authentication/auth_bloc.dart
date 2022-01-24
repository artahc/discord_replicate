import 'dart:developer';

import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_event.dart';
import 'package:discord_replicate/bloc/authentication/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'dart:developer' as dev;

import 'package:hive/hive.dart';

export 'auth_event.dart';
export 'auth_state.dart';

enum RegisterOptions { Phone, Email }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authRepo;

  AuthBloc({AuthService? authRepo})
      : _authRepo = authRepo ?? GetIt.I.get<AuthService>(),
        super(AuthStateInitial()) {
    on<AuthEvent>((event, emit) => _handleEvent(event, emit));
  }

  _handleEvent(AuthEvent event, emit) {
    return event.when(
      initialEvent: () => _handleInitial(emit),
      signInEvent: (id, password) => _signIn(id, password, emit),
      signUpEvent: (id, option) => _signUp(id, option, emit),
      signOutEvent: () => _signOut(emit),
    );
  }

  _handleInitial(emit) async {
    var credential = await _authRepo.getCredential();
    if (credential == null)
      emit(AuthState.signedOut());
    else {
      emit(AuthState.signedIn(credential: credential));
    }
  }

  _signIn(id, password, emit) async {
    emit(AuthState.signingIn());
    var credential = await _authRepo.signIn(id, password);
    emit(AuthState.signedIn(credential: credential));
  }

  _signUp(id, option, emit) async {
    switch (option) {
      case RegisterOptions.Email:
        var credential = await _authRepo.signUpEmail(id);
        emit(AuthState.signedIn(credential: credential));
        break;
      case RegisterOptions.Phone:
        emit(AuthState.error(exception: Exception("Sign up with phone number is not supported yet.")));
        break;
    }
  }

  _signOut(emit) async {
    await _authRepo.signOut();
    await Hive.deleteFromDisk();
    emit(AuthState.signedOut());
  }
}
