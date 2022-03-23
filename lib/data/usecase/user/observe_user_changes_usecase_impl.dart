import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/usecase/user/observe_user_changes_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ObserveUserChangesUseCase, env: [Env.PROD, Env.DEV])
class ObserveUserChangesUseCaseImpl implements ObserveUserChangesUseCase {
  final UserRepository _userRepo;

  ObserveUserChangesUseCaseImpl(this._userRepo);

  @override
  Stream<ObservableEntityEvent<User>> invoke({String? userId}) async* {
    yield* _userRepo.observeChanges(userId: userId);
  }
}
