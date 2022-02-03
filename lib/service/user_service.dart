import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';

abstract class UserService {
  Future<User> getCurrentUser();
  Future<Channel?> getCurrentUserRecentPrivateChannel();
  Future<Server?> getCurrentUserRecentServer();
  Future<User> getUserById(String id);
  Future<void> dispose();
}

class UserServiceImpl implements UserService {
  final AuthService _authService;
  final UserRepository _userRepo;
  final ServerRepository _serverRepo;
  final ChannelRepository _channelRepo;

  UserServiceImpl({AuthService? authService, UserRepository? userRepo, ChannelRepository? channelRepo, ServerRepository? serverRepo})
      : _userRepo = userRepo ?? GetIt.I.get<UserRepository>(),
        _serverRepo = serverRepo ?? GetIt.I.get<ServerRepository>(),
        _channelRepo = channelRepo ?? GetIt.I.get<ChannelRepository>(),
        _authService = authService ?? GetIt.I.get<AuthService>();

  @override
  Future<User> getCurrentUser() async {
    var credential = await _authService.getCredential(forceRefresh: true);
    if (credential == null) throw Exception("Credential not found. User is not currently logged in.");

    var user = await _userRepo.load(credential.uid);
    if (user == null) throw NotFoundException("User not found.");

    if (user.servers.isNotEmpty) await _serverRepo.saveAll(user.servers);
    if (user.privateChannels.isNotEmpty) await _channelRepo.saveAll(user.privateChannels);

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
    var user = await _userRepo.load(id);
    if (user == null) throw NotFoundException("User not found.");

    return user;
  }

  @override
  Future<void> dispose() async {
    await _userRepo.dispose();
  }
}
