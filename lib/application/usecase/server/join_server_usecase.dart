import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/application/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';

abstract class JoinServerUseCase {
  Future<Server> invoke({required String serverId});
}

class JoinServerUseCaseImpl implements JoinServerUseCase {
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  final UserRepository _userRepo;
  final ServerRepository _serverRepo;
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  JoinServerUseCaseImpl({
    UserRepository? userRepo,
    ServerRepository? serverRepo,
    ChannelRepository? channelRepo,
    UserGroupRepository? userGroupRepo,
    GetCurrentUserUseCase? getCurrentChannelUseCase,
  })  : _userRepo = userRepo ?? sl.get(),
        _serverRepo = serverRepo ?? sl.get(),
        _channelRepo = channelRepo ?? sl.get(),
        _userGroupRepo = userGroupRepo ?? sl.get(),
        _getCurrentUserUseCase = getCurrentChannelUseCase ?? sl.get();

  @override
  Future<Server> invoke({required String serverId}) async {
    var currentUser = await _getCurrentUserUseCase.invoke();
    return _serverRepo.joinServer(serverId).then((server) async {
      await _serverRepo.saveServer(server);
      await _channelRepo.saveAllChannels(server.channels);

      var members = await _userGroupRepo.getAllMember(server.userGroupRef);
      await _userGroupRepo.saveAllMembers(server.userGroupRef, members);

      var updatedUser = currentUser.copyWith(
        servers: currentUser.servers.toList(growable: true)..add(server),
      );
      await _userRepo.saveUser(updatedUser);

      return server;
    }).catchError((e, st) {
      log.e("Failed joining server", e, st);
      throw Exception("Failed joining server");
    });
  }
}
