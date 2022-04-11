import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user.dart';

abstract class ObserveUserChangesUseCase {
  Stream<ObservableEntityEvent<String, User>> invoke({String? userId});
}
