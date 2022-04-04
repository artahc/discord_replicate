import '../graphql_operation.dart';

class CreateMessageMutation extends GraphQLOperation {
  final String message;
  final String channelId;
  final int timestamp;

  CreateMessageMutation({
    required this.message,
    required this.channelId,
    required this.timestamp,
  }) : super(
          operation: r"""
            mutation Mutation($input: CreateMessageInput!) {
              createMessage(input: $input) {
                id
                senderRef
                timestamp
                message
              }
            }
          """,
          variables: {
            "input": {
              "channelRef": channelId,
              "message": message,
              "timestamp": timestamp,
            }
          },
        );
}
