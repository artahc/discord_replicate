import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/repository/auth_repository/auth_service.dart';
import 'package:discord_replicate/repository/store.dart';

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
    return _userRepo.getUser(credential.uid);
  }
}
