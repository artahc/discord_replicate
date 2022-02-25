import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/user_group/user_group.dart';

export 'user_group_repository_impl.dart';

class UserGroupQuery {
  UserGroupQuery._();

  static const loadUserGroupById = r"""
    query UserGroup($userGroupRef: ID!, $limit: Int!, $cursor: String) {
      userGroup(userGroupRef: $userGroupRef, limit: $limit, cursor: $cursor) {
        items {
          uid
          name
          avatarUrl
        }
        hasMore
      }
    }
  """;
}

abstract class UserGroupRepository {
  Future<Member> getMemberByUID(String userGroupId, String uid);
  Future<List<Member>> getAllMember(String userGroupId);
  Future<UserGroup> getUserGroup(String id, {int limitMember = 50, String? cursor});
  // Future<PaginationResponse<Member>> loadBatch(String id, int limit, String? lastMemberId);
}
