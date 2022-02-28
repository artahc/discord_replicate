import 'package:discord_replicate/domain/model/message/message.dart';
import 'package:discord_replicate/data/store/hive_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'channel.freezed.dart';
part 'channel.g.dart';

@freezed
class Channel with _$Channel {
  @HiveType(typeId: HiveConstants.CHANNEL_TYPE, adapterName: "ChannelAdapter")
  const factory Channel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String userGroupRef,
    @HiveField(3) @Default(const <Message>[]) List<Message> messages,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> map) => _$ChannelFromJson(map);
}