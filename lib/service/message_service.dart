import 'dart:developer';

import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';

class MessageService {
  final GraphQLClientHelper _api;

  const MessageService(GraphQLClientHelper api) : _api = api;

  Future<Message> sendMessage(String message, String channelId) async {
    String mutation = r"""
      mutation Mutation($input: MessageInput!) {
        createMessage(input: $input) {
          id
          senderRef
          timestamp
          message
        }
      }
    """;

    var variables = {
      "input": {
        "channelRef": channelId,
        "message": message,
        "timestamp": (DateTime.now().millisecondsSinceEpoch.abs() / 1000).abs().toInt(),
      }
    };

    return await _api.mutate(mutation, variables: variables).then((json) => Message.fromJson(json["createMessage"]));
  }

  Stream<Message> subscribe(String channelId) async* {
    String s = r"""
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

    var v = {
      "channelRef": channelId,
    };

    yield* _api
        .subscribe(s, variables: v)
        .map((result) => result["onNewMessage"])
        .where((notification) => notification['topic'] == "OnMessageCreated")
        .map((json) => Message.fromJson(json['payload']));
  }
}
