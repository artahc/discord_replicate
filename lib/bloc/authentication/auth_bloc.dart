import 'dart:developer';

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

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  final UserRepository userRepo;

  AuthBloc({required this.authService, required this.userRepo}) : super(AuthStateInitial()) {
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
    var credential = await authService.getCredential();
    if (credential == null)
      emit(AuthState.signedOut());
    else {
      await userRepo.load(credential.uid).then((user) {
        emit(AuthState.signedIn(credential: credential, user: user));
      }).catchError((e) {
        emit(AuthState.error(exception: e));
      });
    }
  }

  _signIn(id, password, emit) async {
    emit(AuthState.signingIn());
    var credential = await authService.signIn(id, password);

    await userRepo.load(credential.uid).then((user) async {
      emit(AuthState.signedIn(credential: credential, user: user));
    }).onError((error, stackTrace) {
      emit(AuthState.error(exception: error as Exception));
    });
  }

  _signUp(id, option, emit) async {
    switch (option) {
      case RegisterOptions.Email:
        var credential = await authService.signUpEmail(id);
        var user = await userRepo.load(credential.uid);

        // emit(AuthState.signedIn(credential: credential, user: user));
        break;
      case RegisterOptions.Phone:
        emit(AuthState.error(exception: Exception("Sign up with phone number is not supported yet.")));
        break;
    }
  }

  _signOut(emit) async {
    await authService.signOut();
    await Hive.deleteFromDisk();
    emit(AuthState.signedOut());
  }
}
