import '../graphql_operation.dart';

class GetChannelQuery extends GraphQLOperation {
  final String id;
  final int memberLimit;

  GetChannelQuery({
    required this.id,
    required this.memberLimit,
  }) : super(
          operation: r"""
            query Channel($channelId: String!, $limit: Int) {
              channel(id: $channelId) {
                id
                name
                userGroupRef
                messages {
                  id
                  senderRef
                  timestamp
                  message
                }
                members(limit: $limit) {
                  uid
                  name
                  avatarUrl
                }
              }
            }
          """,
          variables: {
            "channelId": id,
            "memberLimit": 30,
          },
        );
}
