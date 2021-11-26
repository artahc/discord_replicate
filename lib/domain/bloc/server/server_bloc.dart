import 'dart:async';

import 'package:discord_replicate/data/model/server_data.dart';
import 'package:discord_replicate/domain/bloc/server/server_event.dart';
import 'package:discord_replicate/domain/bloc/server/server_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  ServerBloc() : super(ServerStateInitial());

  @override
  Stream<ServerState> mapEventToState(ServerEvent event) async* {
    if (event is ServerListLoadEvent) {
      var servers = Iterable<ServerData>.generate(5, (i) => ServerData.createDummy(i)).toList();
      dev.log("Dispatched ${event.runtimeType}", name: this.runtimeType.toString());
      emit(ServerStateLoadListSuccess(servers));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}