import 'package:json_annotation/json_annotation.dart';

part 'generated/user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String name;
  final String? about;
  final String? avatarUrl;

  UserModel(this.uid, this.name, this.about, this.avatarUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
