import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:get_it/get_it.dart';

abstract class UserService {
  Future<User> getCurrentUser();
  Future<void> setCurrentUser();
  Future<User> getUserById(String id);
}

class UserServiceImpl implements UserService {
  final AuthService _authService;
  final UserRepository _userRepo;
  final ChannelRepository _channelRepo;

  UserServiceImpl({AuthService? authService, UserRepository? userRepo, ChannelRepository? channelRepo})
      : _userRepo = userRepo ?? GetIt.I.get<UserRepository>(),
        _channelRepo = channelRepo ?? GetIt.I.get<ChannelRepository>(),
        _authService = authService ?? GetIt.I.get<AuthService>();

  @override
  Future<void> setCurrentUser() async {
    throw UnimplementedError();
  }

  @override
  Future<User> getCurrentUser() async {
    var credential = await _authService.getCredential();
    if (credential == null) throw Exception("Credential not found. User is not currently logged in.");

    var user = await _userRepo.load(credential.uid);
    return user;
  }

  @override
  Future<User> getUserById(String id) async {
    var user = await _userRepo.load(id);
    return user;
  }

}
