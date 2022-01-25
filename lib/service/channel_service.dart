import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:get_it/get_it.dart';

abstract class ChannelService {
  Future<Channel> getChannelById(String id);
  Future<List<Channel>> getAllRecentChannels();
  Future<Message> sendMessage(Message message, String channelId);
  Stream<Message> subscribeChannelMessage(String channelId);
}

class ChannelServiceImpl implements ChannelService {
  final GraphQLClientHelper _api;
  final ChannelRepository _channelRepo;

  ChannelServiceImpl({GraphQLClientHelper? client, ChannelRepository? channelRepo})
      : _api = client ?? GetIt.I.get<GraphQLClientHelper>(),
        _channelRepo = channelRepo ?? GetIt.I.get<ChannelRepository>();

  @override
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

  @override
  Stream<Message> subscribeChannelMessage(String channelId) async* {
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

  @override
  Future<Channel> getChannelById(String id) async {
    var channel = await _channelRepo.load(id);
    return channel;
  }

  @override
  Future<List<Channel>> getAllRecentChannels() {
    // TODO: implement getAllRecentChannels
    throw UnimplementedError();
  }
}
