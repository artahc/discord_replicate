import '../graphql_operation.dart';

class SubscribeChannelMessageSubscription extends GraphQLOperation {
  final String channelId;

  SubscribeChannelMessageSubscription({required this.channelId})
      : super(
          operation: r"""
            subscription OnMessageCreated($channelRef: String!) {
              onNewMessage(channelRef: $channelRef) {
                topic
                channelRef
                payload {
                  id
                  senderRef
                  timestamp
                  message
                }
              }
            }
          """,
          variables: {
            "channelRef": channelId,
          },
        );
}
