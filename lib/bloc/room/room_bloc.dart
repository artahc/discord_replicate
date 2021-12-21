import 'package:discord_replicate/bloc/room/room_event.dart';
import 'package:discord_replicate/bloc/room/room_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomState.initial());

  Stream<RoomState> _loadRoom(String id) async* {}

  @override
  Stream<RoomState> mapEventToState(RoomEvent event) async* {
    yield* event.when(
      loadRoom: _loadRoom,
    );
  }
}
