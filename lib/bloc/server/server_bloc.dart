import 'dart:async';

import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  ServerRepository _serverRepo;

  ServerBloc({required ServerRepository serverRepository})
      : _serverRepo = serverRepository,
        super(ServerStateInitial()) {
    on<ServerEvent>((event, emit) => _handleEvent(event, emit));
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
