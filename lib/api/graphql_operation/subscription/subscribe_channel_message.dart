import 'package:discord_replicate/api/graphql_operation/graphql_operation.dart';

class SubscribeChannelMessageSubscription extends GraphQLOperation {
  final String channelId;

  SubscribeChannelMessageSubscription({required this.channelId});

  @override
  String get operation => r"""
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
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "channelRef": channelId,
    };
  }
}
