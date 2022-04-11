import '../graphql_operation.dart';

class GetChannelMessagesQuery extends GraphQLOperation {
  final String channelId;
  final String? lastMessageId;
  final int limit;

  GetChannelMessagesQuery({
    required this.channelId,
    required this.lastMessageId,
    required this.limit,
  }) : super(
          operation: r"""
            query Messages($channelRef: String!, $cursor: String, $limit: Int!) {
              messages(channelRef: $channelRef, cursor: $cursor, limit: $limit) {
                items {
                  id
                  senderRef
                  timestamp
                  message
                }
                hasMore
                previousCursor
              }
            }
          """,
          variables: {
            "channelRef": channelId,
            "cursor": lastMessageId,
            "limit": limit,
          },
        );
}
