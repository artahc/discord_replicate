import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';

abstract class GetServerByIdUseCase {
  Future<Server> invoke({required String serverId});
}

class GetServerByIdUseCaseImpl implements GetServerByIdUseCase {
  final ServerRepository _serverRepo;

  GetServerByIdUseCaseImpl({ServerRepository? serverRepo}) : _serverRepo = serverRepo ?? sl.get();

  @override
  Future<Server> invoke({required String serverId}) => _serverRepo.getServerById(serverId);
}
