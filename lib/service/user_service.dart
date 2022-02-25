import 'dart:async';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class UserInteractor implements Disposable {
  Future<User> getCurrentUser();
  Future<Channel?> getCurrentUserRecentPrivateChannel();
  Future<Server?> getCurrentUserRecentServer();
  Future<User> getUserById(String id);
}

class UserInteractorImpl implements UserInteractor {
  final AuthService _authService;
  final UserRepository _userRepo;
  final ServerRepository _serverRepo;
  final ChannelRepository _channelRepo;
  final Logger log = Logger();

  User? _currentUser;

  UserInteractorImpl({AuthService? authService, UserRepository? userRepo, ChannelRepository? channelRepo, ServerRepository? serverRepo})
      : _userRepo = userRepo ?? sl.get<UserRepository>(),
        _serverRepo = serverRepo ?? sl.get<ServerRepository>(),
        _channelRepo = channelRepo ?? sl.get<ChannelRepository>(),
        _authService = authService ?? sl.get<AuthService>();

  @override
  Future<User> getCurrentUser() async {
    if (_currentUser != null) {
      log.d("Returning user from cache in user service. $_currentUser");
      return _currentUser!;
    }

    var credential = await _authService.getCredential(forceRefresh: true);
    if (credential == null) throw Exception("Credential not found. User is not currently logged in.");

    var user = await _userRepo.getUser(credential.uid);
    if (user == null) throw NotFoundException("User not found.");

    if (user.servers.isNotEmpty) await _serverRepo.saveServers(user.servers);
    if (user.privateChannels.isNotEmpty) await _channelRepo.saveChannels(user.privateChannels);

    _currentUser = user;
    log.d("Current user: $user");

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
    if (user == null) throw NotFoundException("User not found.");

    return user;
  }

  @override
  FutureOr onDispose() {
    log.d("Dispose user service");
    _currentUser = null;
    log.d("Current user $_currentUser");
  }
}
