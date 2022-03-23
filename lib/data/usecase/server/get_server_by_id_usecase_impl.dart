import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetServerByIdUseCase, env: [Env.PROD, Env.DEV])
class GetServerByIdUseCaseImpl implements GetServerByIdUseCase {
  final ServerRepository _serverRepo;

  GetServerByIdUseCaseImpl(this._serverRepo);

  @override
  Future<Server> invoke({required String serverId}) => _serverRepo.getServerById(serverId);
}
