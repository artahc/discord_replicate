import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:discord_replicate/external/hive_constants.dart';
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
    @HiveField(3) required String userGroupRef,
    @HiveField(4) @Default(const <Channel>[]) List<Channel> channels,
    @HiveField(5) @Default(const <Member>[]) List<Member> members,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> map) => _$ServerFromJson(map);
}
