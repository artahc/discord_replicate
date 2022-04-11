import 'package:discord_replicate/domain/model/server.dart';

abstract class GetServerByIdUseCase {
  Future<Server> invoke({required String serverId});
}
