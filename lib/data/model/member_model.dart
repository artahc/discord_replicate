import 'package:json_annotation/json_annotation.dart';

part 'generated/member_model.g.dart';

@JsonSerializable()
class MemberModel {
  @JsonKey(name: "uid")
  final String id;
  final String name;
  final String? avatarUrl;

  MemberModel(this.id, this.name, this.avatarUrl);

  factory MemberModel.fromJson(Map<String, dynamic> json) => _$MemberModelFromJson(json);
}
