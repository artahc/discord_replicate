import 'package:discord_replicate/bloc/room/room_event.dart';
import 'package:discord_replicate/bloc/room/room_state.dart';
import 'package:discord_replicate/repository/room_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomRepository roomRepo;
  final UserRepository userRepo;

  RoomBloc({required this.roomRepo, required this.userRepo}) : super(RoomState.initial());

  Stream<RoomState> _loadRecentPrivateRoom() async* {
    // var user = userRepo.loadById(uid);
  }

  Stream<RoomState> _loadRecentServerRoom(String serverId) async* {}

  @override
  Stream<RoomState> mapEventToState(RoomEvent event) async* {
    yield* event.when(
      loadRecentPrivateRoom: _loadRecentPrivateRoom,
      loadRecentServerRoom: _loadRecentServerRoom,
    );
  }
}
