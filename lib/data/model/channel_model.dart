import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part '__generated/channel_model.g.dart';

@JsonSerializable()
class ChannelModel {
  final String id;
  final String name;
  final String userGroupRef;

  ChannelModel(this.id, this.name, this.userGroupRef);

  factory ChannelModel.fromJson(Map<String, dynamic> json) => _$ChannelModelFromJson(json);
}
