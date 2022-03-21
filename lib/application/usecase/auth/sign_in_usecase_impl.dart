import 'package:discord_replicate/domain/model/credential.dart';
import 'package:discord_replicate/domain/usecase/auth/sign_in_usecase.dart';

class SignInUseCaseImpl implements SignInUseCase {
  @override
  Future<Credential> invoke(String username, String password) {
    throw UnimplementedError();
  }
}
