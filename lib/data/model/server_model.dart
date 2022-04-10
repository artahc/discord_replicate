import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/server_model.g.dart';

@JsonSerializable()
class ServerModel {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "userGroupRef")
  final String userGroupRef;

  @JsonKey(name: "imageUrl")
  final String? imageUrl;

  @JsonKey(name: "channels", defaultValue: const <ChannelModel>[])
  final List<ChannelModel> channels;

  const ServerModel(this.id, this.name, this.imageUrl, this.userGroupRef, this.channels);

  factory ServerModel.fromJson(Map<String, dynamic> json) => _$ServerModelFromJson(json);
}
