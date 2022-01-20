import 'dart:developer';

import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:logger/logger.dart';

class MessageService {
  final GraphQLClientHelper _api;
  late Logger log = Logger();

  MessageService(GraphQLClientHelper api) : _api = api;

  Future<Message> sendMessage(Message message, String channelId) async {
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
        "message": message.message,
        "timestamp": message.date.millisecondsSinceEpoch,
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
