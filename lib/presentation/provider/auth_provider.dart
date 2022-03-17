import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/application/usecase/auth/sign_in_usecase.dart';

import 'package:discord_replicate/domain/model/credential.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<AuthState> {
  final SignInUseCase _signInUseCase;

  AuthController({
    SignInUseCase? signInUseCase,
  })  : _signInUseCase = signInUseCase ?? sl.get(),
        super(AuthState.initial());

  Future<void> signIn(String username, String password) async {
    state = AuthState.authenticating();
    await Future.delayed(Duration(seconds: 3));
    state = AuthState.authenticated(credential: Credential(email: "", token: "", uid: ""));
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 3));
    state = AuthState.unauthenticated();
  }
}
