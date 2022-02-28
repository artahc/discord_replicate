import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/repository/store.dart';

abstract class GetUserByIdUseCase {
  Future<User> invoke({required String userId});
}

class GetUserByIdUseCaseImpl implements GetUserByIdUseCase {
  final UserRepository _userRepo;

  GetUserByIdUseCaseImpl({UserRepository? userRepo}) : _userRepo = userRepo ?? sl.get();

  @override
  Future<User> invoke({required String userId}) => _userRepo.getUser(userId);
}
