import 'package:discord_replicate/api/graphql_operation/graphql_operation.dart';

class CreateMessageMutation extends GraphQLOperation {
  final String message;
  final String channelId;
  final int timestamp;

  CreateMessageMutation({required this.message, required this.channelId, required this.timestamp});

  @override
  String get operation => r"""
    mutation Mutation($input: CreateMessageInput!) {
        createMessage(input: $input) {
          id
          senderRef
          timestamp
          message
        }
      }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "input": {
        "channelRef": channelId,
        "message": message,
        "timestamp": timestamp,
      }
    };
  }
}
