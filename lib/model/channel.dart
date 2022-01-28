import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/member.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
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
    @HiveField(3) @Default(const <Member>[]) List<Member> members,
    @HiveField(4) @Default(const <Message>[]) List<Message> messages,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> map) => _$ChannelFromJson(map);
}
