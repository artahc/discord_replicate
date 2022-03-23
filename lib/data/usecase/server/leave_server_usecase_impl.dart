import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/usecase/server/leave_server_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LeaveServerUseCase, env: [Env.PROD, Env.DEV])
class LeaveServerUseCaseImpl implements LeaveServerUseCase {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final ServerRepository _serverRepo;
  final ChannelRepository _channelRepo;
  final UserRepository _userRepo;
  final UserGroupRepository _userGroupRepo;

  LeaveServerUseCaseImpl(this._getCurrentUserUseCase, this._serverRepo, this._channelRepo, this._userRepo, this._userGroupRepo);

  @override
  Future<void> invoke({required String serverId}) async {
    var server = await _serverRepo.getServerById(serverId);

    return _serverRepo.leaveServer(serverId).then((_) async {
      var channelIds = server.channels.map((e) => e.id).toList();
      var userGroupId = server.userGroupRef;

      var currentUser = await _getCurrentUserUseCase.invoke();
      var updatedUser = currentUser.copyWith(servers: currentUser.servers.toList()..removeWhere((element) => element.id == serverId));

      await _userGroupRepo.deleteUserGroupById(userGroupId);
      await _channelRepo.deleteAllChannel(channelIds);
      await _userRepo.saveUser(updatedUser);
    });
  }
}
