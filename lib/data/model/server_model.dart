import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/server_model.g.dart';

@JsonSerializable()
class ServerModel {
  final String id;
  final String name;
  final String userGroupRef;
  final String? imageUrl;
  @JsonKey(defaultValue: const <ChannelModel>[])
  final List<ChannelModel> channels;

  ServerModel(this.id, this.name, this.imageUrl, this.userGroupRef, this.channels);

  factory ServerModel.fromJson(Map<String, dynamic> json) => _$ServerModelFromJson(json);
}
