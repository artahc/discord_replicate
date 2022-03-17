import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/domain/model/message.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'generated/channel.freezed.dart';
part 'generated/channel.g.dart';

@freezed
class Channel with _$Channel {
  @HiveType(typeId: HiveConstants.CHANNEL_TYPE, adapterName: "ChannelAdapter")
  const factory Channel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String userGroupRef,
    @HiveField(3) @Default(const <Message>[]) List<Message> messages,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);
}
