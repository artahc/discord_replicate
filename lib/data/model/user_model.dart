import 'package:freezed_annotation/freezed_annotation.dart';

part '__generated/user_model.freezed.dart';
part '__generated/user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    required String name,
    String? about,
    String? avatarUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
