import 'package:discord_replicate/domain/model/credential.dart';

abstract class SignInUseCase {
  Future<Credential> invoke(String username, String password);
}
