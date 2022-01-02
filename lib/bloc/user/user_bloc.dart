import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/auth_service.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthService _authService;
  final UserRepository _userRepo;
  final ServerRepository _serverRepo;

  // cache
  late User _localUser;

  UserBloc({required UserRepository userRepo, required AuthService authService, required ServerRepository serverRepo})
      : _authService = authService,
        _userRepo = userRepo,
        _serverRepo = serverRepo,
        super(UserState.initial()) {
    on<UserEvent>((event, emit) => _handleEvent(event, emit));

    var serverBloc = ServerBloc(serverRepository: _serverRepo);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  _loadLocalUser(emit) async {
    emit(UserState.loadLocalUserInProgress());
    var credential = await _authService.getCredential(forceRefresh: true);
    if (credential == null)
      emit(UserState.loadLocalUserFailed());
    else {
      await _userRepo.load(credential.uid).then((user) async {
        _localUser = user;
        if (user.servers.isNotEmpty) await _serverRepo.saveAll(user.servers);
        emit(UserState.loadLocalUserSuccess(user));
      }).catchError((e) {
        emit(UserState.loadLocalUserFailed());
      });
    }
  }

  _loadUser(String uid, emit) async {}

  _loadPrivateRooms(emit) async {
    emit(UserState.loadRecentPrivateRoomInProgress());

    var credential = await _authService.getCredential();
    if (credential != null) {
      await _userRepo.load(credential.uid).then((user) {
        // todo: Order rooms by lastActive (last message sent / received)
        // todo: Filter recent room by lastVisit (user clicked on the room)
        var rooms = user.privateRooms;
        var recentRoom = user.privateRooms.first;

        emit(UserState.loadRecentPrivateRoomSuccess(rooms, recentRoom));
      });
    } else {}
  }

  Future _handleEvent(UserEvent event, emit) async {
    return await event.when<Future>(
      loadLocalUser: () => _loadLocalUser(emit),
      loadUser: (String uid) => _loadUser(uid, emit),
      loadRecentPrivateRooms: () => _loadPrivateRooms(emit),
    );
  }
}
