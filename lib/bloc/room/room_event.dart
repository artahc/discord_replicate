import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_event.freezed.dart';

@freezed
class RoomEvent with _$RoomEvent {
  const factory RoomEvent.loadRecentPrivateRoom() = RoomEventLoadLastPrivateRoom;
  const factory RoomEvent.loadRecentServerRoom(String serverId) = RoomEventLoadRoom;
}
