import 'package:discord_replicate/common/config/app_config.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

abstract class GetUserByIdUseCase {
  Future<User> invoke({required String userId});
}

class GetUserByIdUseCaseImpl implements GetUserByIdUseCase {
  final UserRepository _userRepo;

  GetUserByIdUseCaseImpl({UserRepository? userRepo}) : _userRepo = userRepo ?? sl.get();

  @override
  Future<User> invoke({required String userId}) => _userRepo.getUserById(userId);
}
