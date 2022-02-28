import 'package:discord_replicate/model/server/server.dart';

abstract class JoinServerUseCase {
  Future<Server> invoke({required String serverId});
}

class JoinServerUseCaseImpl implements JoinServerUseCase {
  @override
  Future<Server> invoke({required String serverId}) {
    throw UnimplementedError();
  }
}
