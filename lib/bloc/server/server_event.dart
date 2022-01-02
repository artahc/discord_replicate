import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_event.freezed.dart';

@freezed
abstract class ServerEvent with _$ServerEvent {
  const factory ServerEvent.loadServer(String id) = ServerEventLoadServer;
}
