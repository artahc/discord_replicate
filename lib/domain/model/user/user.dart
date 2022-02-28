import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/model/server/server.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:discord_replicate/data/store/hive_constants.dart';
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

extension UserToMember on User {
  Member toMember() {
    return Member(uid: this.uid, name: this.name, avatarUrl: this.avatarUrl);
  }
}
