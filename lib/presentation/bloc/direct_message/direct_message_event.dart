import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/direct_message_event.freezed.dart';

@freezed
class DirectMessageEvent with _$DirectMessageEvent {
  const factory DirectMessageEvent.loadRecent() = DirectMessageLoadRecent;
}
