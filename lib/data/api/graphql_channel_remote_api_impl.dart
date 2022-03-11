import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/channel.dart';

import 'client/graphql_operation/mutation/create_channel_message_operation.dart';
import 'client/graphql_operation/query/get_channel_messages_operation.dart';
import 'client/graphql_operation/query/get_channel_query_operation.dart';
import 'client/graphql_operation/subscription/subscribe_channel_message_subscription.dart';

class GraphQLChannelRemoteApiImpl implements ChannelRemoteApi {
  final GraphQLClientHelper _client;

  GraphQLChannelRemoteApiImpl({GraphQLClientHelper? client}) : _client = client ?? sl.get();

  @override
  Future<RawMessage> createMessage(String channelId, String message, int timestamp) {
    var operation = CreateMessageMutation(message: message, channelId: channelId, timestamp: timestamp);
    return _client.mutate(operation).then((json) => RawMessage.fromJson(json["createMessage"]));
  }

  @override
  Future<Channel> getChannelById(String id) {
    final query = GetChannelQuery(id: id, memberLimit: 30);

    return _client.query(query).then((json) async {
      var channel = Channel.fromJson(json['channel']);
      return channel;
    });
  }

  @override
  Future<PaginationResponse<RawMessage>> getChannelMessages(String channelId, int limit, String? cursor) {
    var operation = GetChannelMessagesQuery(channelId: channelId, lastMessageId: cursor, limit: limit);

    var paginationResult = _client.query(operation).then((json) {
      var rawList = json['messages']['items'] as List<dynamic>;
      var rawMessages = rawList.map((element) => RawMessage.fromJson(element as Map<String, dynamic>)).toList();
      var hasMore = json['messages']['hasMore'] as bool;
      var previousCursor = json['messages']['previousCursor'] as String?;

      var response = PaginationResponse<RawMessage>(
        items: rawMessages,
        hasMore: hasMore,
        cursor: previousCursor,
      );

      return response;
    });

    return paginationResult;
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
