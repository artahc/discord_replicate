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

  AuthBloc(this._authRepo) : super(const AuthStateInitial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        initial: () => _initial(emit),
        signIn: (id, password) => _signIn(id, password, emit),
        signUp: (option, id) => _signUp(id, option, emit),
        signOut: () => _signOut(emit),
      );
    });
  }

  Future<void> _initial(emit) async {
    await _authRepo.getCredential().then((credential) {
      if (credential == null) {
        emit(const AuthState.unauthenticated());
      } else {
        emit(AuthState.authenticated(credential: credential));
      }
    }).onError((error, stackTrace) {
      log.e("Error when getting credential from firebase.", error, stackTrace);
      emit(const AuthState.unauthenticated());
    });
  }

  Future<void> _signIn(String id, String password, emit) async {
    emit(const AuthState.authenticating());
    await _authRepo.signIn(id, password).then((credential) {
      emit(AuthState.authenticated(credential: credential));
    }).onError((error, stackTrace) {
      emit(AuthState.error(exception: error as Exception));
    });
  }

  Future<void> _signUp(String id, RegisterOptions option, emit) async {
    emit(const AuthState.authenticating());
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

  Future<void> _signOut(emit) async {
    await _authRepo.signOut();
    await sl.reset().then((value) {
      configureDependencies(sl, Env.DEV);
    });
    emit(const AuthState.unauthenticated());
  }
}
