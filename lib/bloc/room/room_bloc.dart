import 'dart:async';

import 'package:discord_replicate/bloc/room/room_event.dart';
import 'package:discord_replicate/bloc/room/room_state.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final ChannelRepository _channelRepo;
  final UserRepository _userRepo;

  final ServerBloc _serverBloc;
  final UserBloc _userBloc;

  late StreamSubscription _serverStateSubscription;
  late StreamSubscription _userStateSubscription;

  RoomBloc({required ChannelRepository channelRepo, required UserRepository userRepo, required ServerBloc serverBloc, required UserBloc userBloc})
      : _channelRepo = channelRepo,
        _userRepo = userRepo,
        _serverBloc = serverBloc,
        _userBloc = userBloc,
        super(RoomState.initial()) {
    on<RoomEvent>((event, emit) => _handleEvent(event, emit));

    // _userStateSubscription = _userBloc.stream.listen((state) {
    //   state.whenOrNull(
    //     loadLocalUserSuccess: (user) {
    //       // todo: Load recent room when
    //     },
    //     loadRecentPrivateRoomSuccess: (rooms, recentRoom) {
    //       add(RoomEvent.loadRoom(recentRoom.id));
    //     },
    //   );
    // });

    _serverStateSubscription = _serverBloc.stream.listen((state) {
      state.whenOrNull(
        loadServerSuccess: (server, recentChannel) {
          add(RoomEvent.loadRoom(recentChannel.id));
        },
      );
    });
  }

  Future _loadRoom(String id, emit) async {
    await _channelRepo.load(id).then((room) {
      emit(RoomState.loadRoomSuccess(room));
    });
  }

  _handleEvent(RoomEvent event, emit) async {
    return await event.maybeWhen<Future>(
      loadRoom: (id) => _loadRoom(id, emit),
      orElse: () {
        throw UnimplementedError();
      },
    );
  }

  @override
  Future<void> close() {
    _serverStateSubscription.cancel();
    return super.close();
  }
}
