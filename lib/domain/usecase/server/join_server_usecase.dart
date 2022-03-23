import 'package:discord_replicate/domain/model/server.dart';
abstract class JoinServerUseCase {
  Future<Server> invoke({required String serverId});
}
