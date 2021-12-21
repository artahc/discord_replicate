import 'dart:async';

import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  ServerRepository serverRepository;

  ServerBloc({required this.serverRepository}) : super(ServerStateInitial());

  Stream<ServerState> _loadAll() async* {
    var servers = await serverRepository.loadAll();
    emit(ServerState.loadListSuccess(servers));
  }

  Stream<ServerState> _loadOne(String serverId) async* {
    var server = await serverRepository.loadById(serverId);
    emit(ServerState.loadSelectedSuccess(server));
  }

  @override
  Stream<ServerState> mapEventToState(ServerEvent event) async* {
    yield* event.when(
      loadAll: _loadAll,
      loadOne: _loadOne,
    );
  }
}
