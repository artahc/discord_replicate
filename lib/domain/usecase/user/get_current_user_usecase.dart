import 'package:discord_replicate/common/config/app_config.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';

abstract class GetCurrentUserUseCase {
  Future<User> invoke();
}

class GetCurrentUserUseCaseImpl implements GetCurrentUserUseCase {
  final AuthRepository _authRepo;
  final UserRepository _userRepo;

  GetCurrentUserUseCaseImpl({AuthRepository? authRepo, UserRepository? userRepo})
      : _authRepo = authRepo ?? sl.get(),
        _userRepo = userRepo ?? sl.get();

  @override
  Future<User> invoke() async {
    var credential = await _authRepo.getCredential(forceRefresh: true);
    if (credential == null) return Future.error("User is unauthenticated.");
    return _userRepo.getUserById(credential.uid);
  }
}
