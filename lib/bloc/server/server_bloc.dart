import 'dart:async';

import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/repository/server_repository/server_repository.dart';
import 'package:discord_replicate/interactor/server/server_interactor.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'server_event.dart';
export 'server_state.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  final ServerInteractor _serverService;

  StreamController<ServerEvent> _eventStream = StreamController.broadcast();
  Stream<ServerEvent> get eventStream => _eventStream.stream;

  ServerBloc({ServerRepository? serverRepository, ServerInteractor? serverService})
      : _serverService = serverService ?? sl.get<ServerInteractor>(),
        super(ServerState.loading()) {
    on<ServerEvent>((event, emit) => _handleEvent(event, emit));
  }

  @override
  void onEvent(ServerEvent event) {
    _eventStream.sink.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() async {
    _eventStream.close();
    return super.close();
  }

  Future<void> _loadServer(String id, emit) async {
    emit(ServerState.loading());

    await _serverService.getServerById(id: id).then((server) {
      emit(ServerState.loaded(server, server.channels.first));
    });
  }

  _handleEvent(ServerEvent event, emit) async {
    return await event.when(
      loadServer: (String id) => _loadServer(id, emit),
    );
  }
}
