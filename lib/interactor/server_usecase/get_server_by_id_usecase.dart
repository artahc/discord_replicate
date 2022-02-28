import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/repository/server_repository/server_repository.dart';

abstract class GetServerByIdUseCase {
  Future<Server> invoke({required String serverId});
}

class GetServerByIdUseCaseImpl implements GetServerByIdUseCase {
  final ServerRepository _serverRepo;

  GetServerByIdUseCaseImpl({ServerRepository? serverRepo}) : _serverRepo = serverRepo ?? sl.get();

  @override
  Future<Server> invoke({required String serverId}) => _serverRepo.getServer(serverId);
}
