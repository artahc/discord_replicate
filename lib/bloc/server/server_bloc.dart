import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'server_event.dart';
export 'server_state.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  final ServerRepository _serverRepo;
  // final UserBloc _userBloc;

  late StreamSubscription _userStateSubscription;

  StreamController<ServerEvent> _eventStream = StreamController.broadcast();
  Stream<ServerEvent> get eventStream => _eventStream.stream;

  ServerBloc({required ServerRepository serverRepository})
      : _serverRepo = serverRepository,
        super(ServerState.initial()) {
    on<ServerEvent>((event, emit) => _handleEvent(event, emit));

    // _userStateSubscription = _userBloc.stream.listen((state) {
    //   state.whenOrNull(
    //     loadUserSuccess: (user) {
    //       log("Adding ServerEvent.loadServer in response of UserState.loadLocalUserSuccess", name: runtimeType.toString());
    //       add(ServerEvent.loadServer(user.servers.first.id));
    //     },
    //   );
    // });
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
    await _serverRepo.load(id).then((server) {
      emit(ServerState.loadServerSuccess(server, server.channels.first));
    });
  }

  _handleEvent(ServerEvent event, emit) async {
    return await event.when(
      loadServer: (String id) => _loadServer(id, emit),
    );
  }
}
