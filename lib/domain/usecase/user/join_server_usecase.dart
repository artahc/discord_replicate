import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/domain/model/server/server.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';

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
    var server = await _serverRepo.joinServer(userId: currentUser.uid, serverId: serverId);
    await _serverRepo.saveServer(server);
    await _channelRepo.saveChannels(server.channels);

    var userGroup = await _userGroupRepo.getAllMember(server.userGroupRef);
    throw UnimplementedError();
  }
}