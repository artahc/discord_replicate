import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

abstract class ObserveUserChangesUseCase {
  Stream<ObservableEntityEvent<User>> invoke({String? userId});
}

class ObserveUserChangesUseCaseImpl implements ObserveUserChangesUseCase {
  final UserRepository _userRepo;

  ObserveUserChangesUseCaseImpl({
    UserRepository? userRepo,
  }) : _userRepo = userRepo ?? sl.get();

  @override
  Stream<ObservableEntityEvent<User>> invoke({String? userId}) async* {
    yield* _userRepo.observeChanges(userId: userId);
  }
}
