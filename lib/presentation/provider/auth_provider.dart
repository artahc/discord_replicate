import 'package:discord_replicate/application/config/app_config.dart';
import 'package:discord_replicate/application/usecase/auth/sign_in_usecase.dart';

import 'package:discord_replicate/domain/model/credential.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<Credential?> {
  final SignInUseCase _signInUseCase;

  AuthController({
    SignInUseCase? signInUseCase,
  })  : _signInUseCase = signInUseCase ?? sl.get(),
        super(null);

  Future<void> signIn(String username, String password) async {
    await _signInUseCase.invoke(username, password).then((credential) {
      state = credential;
    });
  }
}
