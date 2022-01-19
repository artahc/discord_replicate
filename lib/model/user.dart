import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: HiveConstants.USER_TYPE, adapterName: "UserAdapter")
  factory User({
    @HiveField(0) required String uid,
    @HiveField(1) required String name,
    @HiveField(2) required String? avatarUrl,
    @HiveField(3) required String? about,
    @HiveField(4) @Default(const <Server>[]) List<Server> servers,
    @HiveField(5) @Default(const <Channel>[]) List<Channel> privateChannels,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);
}
