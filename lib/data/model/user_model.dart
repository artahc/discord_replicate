import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:discord_replicate/data/model/server_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "uid")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "about")
  final String? about;

  @JsonKey(name: "avatarUrl")
  final String? avatarUrl;

  @JsonKey(name: "servers", defaultValue: <ServerModel>[])
  final List<ServerModel> servers;

  @JsonKey(name: "privateChannels", defaultValue: <ChannelModel>[])
  final List<ChannelModel> privateChannels;

  const UserModel(this.id, this.name, this.about, this.avatarUrl, this.servers, this.privateChannels);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
