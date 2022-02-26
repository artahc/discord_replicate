import 'package:discord_replicate/api/graphql_operation.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/api/paginated_response.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/app_config.dart';

abstract class RemoteApi {
  Future<User> getUser(String id);
  Future<Server> getServer(String id);
  Future<Channel> getChannel(String id);
  Future<PaginationResponse<Member>> getUserGroup(String id, int limitMember, String? cursor);
  Future<PaginationResponse<RawMessage>> getChannelMessages(String channelId, int limit, String? cursor);
  Future<RawMessage> createMessage(String channelId, String message, int timestamp);
  Stream<RawMessage> subscribeChannelMessage(String channelId);
}

class GraphQLApiImpl implements RemoteApi {
  final GraphQLClientHelper _client;

  GraphQLApiImpl({GraphQLClientHelper? client}) : _client = client ?? sl.get<GraphQLClientHelper>();

  @override
  Future<Channel> getChannel(String id) {
    final query = GetChannelQuery(id: id, memberLimit: 30);

    return _client.query(query).then((json) async {
      var channel = Channel.fromJson(json['channel']);
      return channel;
    });
  }

  @override
  Future<Server> getServer(String id) {
    var operation = GetServerQuery(id: id);
    return _client.query(operation).then((json) => Server.fromJson(json['server']));
  }

  @override
  Future<User> getUser(String id) {
    var operation = GetUserQuery(uid: id);
    return _client.query(operation).then((json) => User.fromJson(json['user']));
  }

  @override
  Future<PaginationResponse<Member>> getUserGroup(String id, int limit, String? cursor) {
    var operation = GetUserGroupQuery(userGroupId: id, limit: limit, cursor: cursor);
    return _client.query(operation).then((json) {
      var raw = json['userGroup']['items'] as List<Object?>;
      var hasMore = json['userGroup']['hasMore'] as bool;
      var members = raw.map((e) => Member.fromJson(e as Map<String, dynamic>)).toList();

      return PaginationResponse(items: members, hasMore: hasMore);
    });
  }

  @override
  Future<PaginationResponse<RawMessage>> getChannelMessages(String channelId, int limit, String? lastMessageId) {
    var operation = GetChannelMessagesQuery(channelId: channelId, lastMessageId: lastMessageId, limit: limit);

    var paginationResult = _client.query(operation).then((json) {
      var rawList = json['messages']['items'] as List<dynamic>;
      var rawMessages = rawList.map((element) => RawMessage.fromJson(element as Map<String, dynamic>)).toList();
      var hasMore = json['messages']['hasMore'] as bool;
      var previousCursor = json['messages']['previousCursor'] as String?;

      var response = PaginationResponse<RawMessage>(
        items: rawMessages,
        hasMore: hasMore,
        previousCursor: previousCursor,
      );

      return response;
    });

    return paginationResult;
  }

  @override
  Future<RawMessage> createMessage(String channelId, String message, int timestamp) {
    var operation = CreateMessageMutation(message: message, channelId: channelId, timestamp: timestamp);
    return _client.mutate(operation).then((json) => RawMessage.fromJson(json["createMessage"]));
  }

  @override
  Stream<RawMessage> subscribeChannelMessage(String channelId) {
    var operation = SubscribeChannelMessageSubscription(channelId: channelId);
    return _client
        .subscribe(operation)
        .map((result) => result["onNewMessage"])
        .where((notification) => notification['topic'] == "OnMessageCreated")
        .map((json) => RawMessage.fromJson(json['payload']));
  }
}
