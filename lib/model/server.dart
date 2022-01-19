import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:hive/hive.dart';

part 'server.freezed.dart';
part 'server.g.dart';

@freezed
class Server with _$Server {
  @HiveType(typeId: HiveConstants.SERVER_TYPE, adapterName: "ServerAdapter")
  factory Server({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String imageUrl,
    @HiveField(3) @Default(const <Channel>[]) List<Channel> channels,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> map) => _$ServerFromJson(map);
}
