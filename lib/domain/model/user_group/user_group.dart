import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/common/hive_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_group.freezed.dart';
part 'user_group.g.dart';

@freezed
class UserGroup with _$UserGroup {
  @HiveType(typeId: HiveConstants.USER_GROUP_TYPE, adapterName: "UserGroupAdapter")
  const factory UserGroup({
    @HiveField(0) required String id,
    @HiveField(1) @Default(const {}) Map<String, Member> members,
  }) = _UserGroup;
}