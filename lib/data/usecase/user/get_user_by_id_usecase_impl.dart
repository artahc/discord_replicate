import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUserByIdUseCase, env: [Env.PROD, Env.DEV])
class GetUserByIdUseCaseImpl implements GetUserByIdUseCase {
  final UserRepository _userRepo;

  GetUserByIdUseCaseImpl(this._userRepo);

  @override
  Future<User> invoke({required String userId}) => _userRepo.getUserById(userId);
}
