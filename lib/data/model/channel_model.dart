import 'package:discord_replicate/data/model/member_model.dart';
import 'package:discord_replicate/data/model/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/channel_model.g.dart';

@JsonSerializable()
class ChannelModel {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "userGroupRef")
  final String userGroupRef;

  @JsonKey(name: "messages", defaultValue: <MessageModel>[])
  final List<MessageModel> messages;

  @JsonKey(name: "members", defaultValue: <MemberModel>[])
  final List<MemberModel> members;

  const ChannelModel(this.id, this.name, this.userGroupRef, this.messages, this.members);

  factory ChannelModel.fromJson(Map<String, dynamic> json) => _$ChannelModelFromJson(json);
}
