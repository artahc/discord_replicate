import 'package:discord_replicate/interactor/user/user_interactor.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/repository/auth_repository/auth_service.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:logger/logger.dart';

class UserInteractorImpl implements UserInteractor {
  final AuthRepository _authService;
  final UserRepository _userRepo;
  final ServerRepository _serverRepo;
  final ChannelRepository _channelRepo;
  final Logger log = Logger();

  UserInteractorImpl({AuthRepository? authService, UserRepository? userRepo, ChannelRepository? channelRepo, ServerRepository? serverRepo})
      : _userRepo = userRepo ?? sl.get(),
        _serverRepo = serverRepo ?? sl.get(),
        _channelRepo = channelRepo ?? sl.get(),
        _authService = authService ?? sl.get();

  @override
  Future<User> getCurrentUser() async {
    var credential = await _authService.getCredential(forceRefresh: true);
    if (credential == null) throw Exception("Credential not found. User is not currently logged in.");

    var user = await _userRepo.getUser(credential.uid);

    if (user.servers.isNotEmpty) await _serverRepo.saveServers(user.servers);
    if (user.privateChannels.isNotEmpty) await _channelRepo.saveChannels(user.privateChannels);

    return user;
  }

  @override
  Future<Channel?> getCurrentUserRecentPrivateChannel() async {
    var privateChannels = await getCurrentUser().then((user) => user.privateChannels);
    if (privateChannels.isEmpty) return null;

    // todo: Sort channel by lastVisit
    var recentChannel = privateChannels.first;
    return recentChannel;
  }

  @override
  Future<Server?> getCurrentUserRecentServer() async {
    var servers = await getCurrentUser().then((user) => user.servers);
    if (servers.isEmpty) return null;

    // todo: Sort server and its channel by last visit.
    var recentServer = servers.first;
    return recentServer;
  }

  @override
  Future<User> getUserById(String id) async {
    var user = await _userRepo.getUser(id);

    return user;
  }
}
