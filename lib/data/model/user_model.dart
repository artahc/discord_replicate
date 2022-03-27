import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:discord_replicate/data/model/server_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String name;
  final String? about;
  final String? avatarUrl;

  @JsonKey(defaultValue: const <ServerModel>[])
  final List<ServerModel> servers;

  @JsonKey(defaultValue: const <ChannelModel>[])
  final List<ChannelModel> privateChannels;

  UserModel(this.uid, this.name, this.about, this.avatarUrl, this.servers, this.privateChannels);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
