import 'dart:async';

import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart';

import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/domain/usecase/server/join_server_usecase.dart';
import 'package:discord_replicate/domain/usecase/server/leave_server_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'server_event.dart';
import 'server_state.dart';

export 'server_event.dart';
export 'server_state.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  StreamController<ServerEvent> _eventStream = StreamController.broadcast();
  Stream<ServerEvent> get eventStream => _eventStream.stream;

  // Use Cases
  final GetServerByIdUseCase _getServerByIdUseCase;
  final JoinServerUseCase _joinServerUseCase;
  final LeaveServerUseCase _leaveServerUseCase;

  ServerBloc({GetServerByIdUseCase? getServerByIdUseCase, JoinServerUseCase? joinServerUseCase, LeaveServerUseCase? leaveServerUseCase})
      : _getServerByIdUseCase = getServerByIdUseCase ?? sl.get(),
        _joinServerUseCase = joinServerUseCase ?? sl.get(),
        _leaveServerUseCase = leaveServerUseCase ?? sl.get(),
        super(ServerState.loading()) {
    on<ServerEvent>((event, emit) {
      return event.when(
        loadServer: (String id) => _loadServer(id, emit),
        leaveServer: (String serverId) => _leaveServer(serverId, emit),
        joinServer: (String serverId) => _joinServer(serverId, emit),
      );
    });
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

  Future<void> _loadServer(String serverId, emit) async {
    emit(ServerState.loading());

    await _getServerByIdUseCase.invoke(serverId: serverId).then((server) {
      emit(ServerState.loaded(server, server.channels.first));
    });
  }

  Future<void> _joinServer(String serverId, emit) async {
    await _joinServerUseCase.invoke(serverId: serverId).then((value) {
      emit();
    });
  }

  Future<void> _leaveServer(String serverId, emit) async {}
}
