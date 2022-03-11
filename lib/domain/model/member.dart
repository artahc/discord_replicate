import 'package:discord_replicate/common/hive_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part '__generated/member.freezed.dart';
part '__generated/member.g.dart';

@freezed
class Member with _$Member {
  @HiveType(typeId: HiveConstants.MEMBER_TYPE, adapterName: "MemberAdapter")
  const factory Member({
    @HiveField(0) required String uid,
    @HiveField(1) required String name,
    @HiveField(2) String? avatarUrl,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> map) => _$MemberFromJson(map);
}
