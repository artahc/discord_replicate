import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  final ServerRepository _serverRepo;
  final UserBloc _userBloc;

  late StreamSubscription _userStateSubscription;

  ServerBloc({required ServerRepository serverRepository, required UserBloc userBloc})
      : _serverRepo = serverRepository,
        _userBloc = userBloc,
        super(ServerState.initial()) {
    on<ServerEvent>((event, emit) => _handleEvent(event, emit));

    _userStateSubscription = _userBloc.stream.listen((state) {
      state.whenOrNull(
        loadUserSuccess: (user) {
          log("Adding ServerEvent.loadServer in response of UserState.loadLocalUserSuccess", name: runtimeType.toString());
          add(ServerEvent.loadServer(user.servers.first.id));
        },
      );
    });
  }

  @override
  Future<void> close() async {
    _userStateSubscription.cancel();
    return super.close();
  }

  Future<void> _loadServer(String id, emit) async {
    emit(ServerState.loadServerInProgress());
    await _serverRepo.load(id).then((server) {
      emit(ServerState.loadServerSuccess(server, server.channels.first));
    });
  }

  _handleEvent(ServerEvent event, emit) async {
    return await event.maybeWhen(
      loadServer: (String id) => _loadServer(id, emit),
      orElse: () async {
        throw UnimplementedError();
      },
    );
  }
}
