import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/service/server_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

export 'server_event.dart';
export 'server_state.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  final ServerService _serverService;

  late StreamSubscription _userStateSubscription;

  StreamController<ServerEvent> _eventStream = StreamController.broadcast();
  Stream<ServerEvent> get eventStream => _eventStream.stream;

  ServerBloc({ServerRepository? serverRepository, ServerService? serverService})
      : _serverService = serverService ?? GetIt.I.get<ServerService>(),
        super(ServerState.initial()) {
    on<ServerEvent>((event, emit) => _handleEvent(event, emit));
  }

  @override
  void onEvent(ServerEvent event) {
    _eventStream.sink.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() async {
    _userStateSubscription.cancel();
    _eventStream.close();
    return super.close();
  }

  Future<void> _loadServer(String id, emit) async {
    emit(ServerState.loadServerInProgress());
    await _serverService.getServerById(id).then((server) {
      emit(ServerState.loadServerSuccess(server, server.channels.first));
    });
  }

  _handleEvent(ServerEvent event, emit) async {
    return await event.when(
      loadServer: (String id) => _loadServer(id, emit),
    );
  }
}
