import 'package:discord_replicate/data/model/member_model.dart';
import 'package:discord_replicate/data/model/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/channel_model.g.dart';

@JsonSerializable()
class ChannelModel {
  final String id;
  final String name;
  final String userGroupRef;
  final List<MessageModel> messages;
  final List<MemberModel> members;

  ChannelModel(this.id, this.name, this.userGroupRef, this.messages, this.members);

  factory ChannelModel.fromJson(Map<String, dynamic> json) => _$ChannelModelFromJson(json);
}
