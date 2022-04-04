import '../graphql_operation.dart';

class GetUserGroupQuery extends GraphQLOperation {
  final String userGroupId;
  final int limit;
  final String? cursor;

  GetUserGroupQuery({
    required this.userGroupId,
    required this.limit,
    required this.cursor,
  }) : super(
          operation: r"""
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
          """,
          variables: {
            "userGroupRef": userGroupId,
            "limit": 50,
            "cursor": null,
          },
        );
}
