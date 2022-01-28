import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/member.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/user_group_repository.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:get_it/get_it.dart';

abstract class ChannelService {
  Future<Channel> getChannelById(String id);

  Future<List<Member>> getAllMembers(String userGroupId);
  Future<Member> getMemberById(String userGroupId, String userId);

  Future<List<Message>> fetchMessages(String channelId);
  Future<Message> sendMessage(Message message, String channelId);
  Stream<Message> subscribeMessage(String channelId);
}

class ChannelServiceImpl implements ChannelService {
  final GraphQLClientHelper _api;
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  ChannelServiceImpl({
    GraphQLClientHelper? client,
    ChannelRepository? channelRepo,
    UserGroupRepository? userGroupRepo,
  })  : _api = client ?? GetIt.I.get<GraphQLClientHelper>(),
        _channelRepo = channelRepo ?? GetIt.I.get<ChannelRepository>(),
        _userGroupRepo = userGroupRepo ?? GetIt.I.get<UserGroupRepository>();

  @override
  Future<Channel> getChannelById(String id) async {
    var channel = await _channelRepo.load(id);
    return channel;
  }

  @override
  Future<List<Member>> getAllMembers(String userGroupId) async {
    var userGroup = await _userGroupRepo.load(userGroupId);
    return userGroup.members.values.toList();
  }

  @override
  Future<Member> getMemberById(String userGroupId, String userId) async {
    var userGroup = await _userGroupRepo.load(userGroupId);
    if (!userGroup.members.containsKey(userId)) throw Exception("User not found in database.");

    var member = userGroup.members[userId];
    return member!;
  }

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
  Stream<Message> subscribeMessage(String channelId) async* {
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
  Future<List<Message>> fetchMessages(String channelId) async {
    return <Message>[];
  }
}
