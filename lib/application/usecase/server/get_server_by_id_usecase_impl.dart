import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart';

class GetServerByIdUseCaseImpl implements GetServerByIdUseCase {
  final ServerRepository _serverRepo;

  GetServerByIdUseCaseImpl({ServerRepository? serverRepo}) : _serverRepo = serverRepo ?? sl.get();

  @override
  Future<Server> invoke({required String serverId}) => _serverRepo.getServerById(serverId);
}
