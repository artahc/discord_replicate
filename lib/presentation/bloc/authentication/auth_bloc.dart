import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

enum RegisterOptions { Phone, Email }

@LazySingleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;

  AuthBloc(this._authRepo) : super(AuthStateInitial()) {
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
    await _authRepo.getCredential().then((credential) {
      if (credential == null)
        emit(AuthState.unauthenticated());
      else {
        emit(AuthState.authenticated(credential: credential));
      }
    }).onError((error, stackTrace) {
      log.e("Error when getting credential from firebase.", error, stackTrace);
      emit(AuthState.unauthenticated());
    });
  }

  _signIn(String id, String password, emit) async {
    emit(AuthState.authenticating());
    await _authRepo.signIn(id, password).then((credential) {
      emit(AuthState.authenticated(credential: credential));
    }).onError((error, stackTrace) {
      emit(AuthState.error(exception: error as Exception));
    });
  }

  _signUp(String id, RegisterOptions option, emit) async {
    emit(AuthState.authenticating());
    switch (option) {
      case RegisterOptions.Email:
        await _authRepo.signUpEmail(id).then((credential) {
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
    await _authRepo.signOut();
    await sl.reset().then((value) {
      print("Service locator reset.");
    });
    // await Configuration.initServiceLocator();
    emit(AuthState.unauthenticated());
  }
}
