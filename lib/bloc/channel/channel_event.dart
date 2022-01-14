import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_event.freezed.dart';

@freezed
abstract class ChannelEvent with _$ChannelEvent {
  const factory ChannelEvent.loadRecentPrivate() = ChannelEventLoadRecentPrivate;
  const factory ChannelEvent.loadChannel(String id) = ChannelEventLoadChannel;
}
