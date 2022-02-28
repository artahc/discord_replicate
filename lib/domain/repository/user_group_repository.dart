import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/model/user_group/user_group.dart';

import 'package:get_it/get_it.dart';

abstract class UserGroupRepository implements Disposable {
  Future<Member> getMemberById(String userGroupId, String uid);
  Future<List<Member>> getAllMember(String userGroupId);
  Future<UserGroup> getUserGroup(String id, {int limitMember = 50, String? cursor});
}
