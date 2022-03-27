import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetCurrentUserUseCase, env: [Env.PROD, Env.DEV])
class GetCurrentUserUseCaseImpl implements GetCurrentUserUseCase {
  final AuthRepository _authRepo;
  final UserRepository _userRepo;

  GetCurrentUserUseCaseImpl(this._authRepo, this._userRepo);

  @override
  Future<User> invoke() async {
    // var credential = await _authRepo.getCredential(forceRefresh: true);
    // if (credential == null) return Future.error("User is unauthenticated.");
    return _userRepo.getUserById("FMYbWPwFWgTvRemhbbz1dLL9HkC2");
  }
}
