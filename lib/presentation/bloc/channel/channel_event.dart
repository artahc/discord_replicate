import 'package:freezed_annotation/freezed_annotation.dart';

part '__generated/channel_event.freezed.dart';

@freezed
abstract class ChannelEvent with _$ChannelEvent {
  const factory ChannelEvent.load(String id) = ChannelEventLoad;
}
