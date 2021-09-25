import 'dart:async';

import 'package:discord_replicate/data/model/channel_data.dart';
import 'package:discord_replicate/data/model/server_data.dart';
import 'package:discord_replicate/domain/bloc/server/server_event.dart';
import 'package:discord_replicate/domain/bloc/server/server_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {

  ServerBloc() : super(ServerListInitial());

  @override
  Stream<ServerState> mapEventToState(ServerEvent event) async* {
    if (event is ServerListLoadEvent) {
      var servers = Iterable<ServerData>.generate(10, (i) => ServerData.createDummy(i)).toList();
      emit (ServerListLoaded(servers));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
