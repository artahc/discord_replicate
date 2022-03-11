import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:discord_replicate/common/hive_constants.dart';
import 'package:hive/hive.dart';

part '__generated/server.freezed.dart';
part '__generated/server.g.dart';

@freezed
class Server with _$Server {
  @HiveType(typeId: HiveConstants.SERVER_TYPE, adapterName: "ServerAdapter")
  factory Server({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String imageUrl,
    @HiveField(3) required String userGroupRef,
    @HiveField(4) @Default(const <Channel>[]) List<Channel> channels,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> map) => _$ServerFromJson(map);
}
