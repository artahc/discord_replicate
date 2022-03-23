import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

abstract class ObserveUserChangesUseCase {
  Stream<ObservableEntityEvent<User>> invoke({String? userId});
}
