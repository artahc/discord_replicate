import 'package:discord_replicate/application/config/hive_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'generated/member.freezed.dart';
part 'generated/member.g.dart';

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
