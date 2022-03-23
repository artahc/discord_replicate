import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/credential.dart';
import 'package:discord_replicate/domain/usecase/auth/sign_in_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInUseCase, env: [Env.PROD, Env.DEV])
class SignInUseCaseImpl implements SignInUseCase {
  @override
  Future<Credential> invoke(String username, String password) {
    throw UnimplementedError();
  }
}
