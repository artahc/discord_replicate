import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';

abstract class GetServerByIdUseCase {
  Future<Server> invoke({required String serverId});
}
