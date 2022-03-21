import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart';

class GetUserByIdUseCaseImpl implements GetUserByIdUseCase {
  final UserRepository _userRepo;

  GetUserByIdUseCaseImpl({UserRepository? userRepo}) : _userRepo = userRepo ?? sl.get();

  @override
  Future<User> invoke({required String userId}) => _userRepo.getUserById(userId);
}
