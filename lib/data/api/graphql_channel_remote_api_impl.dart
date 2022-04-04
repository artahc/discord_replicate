import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/mapper/channel_mapper.dart';
import 'package:discord_replicate/data/mapper/message_mapper.dart';
import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:discord_replicate/data/model/message_model.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:injectable/injectable.dart';

import 'client/graphql_operation/mutation/create_channel_message_operation.dart';
import 'client/graphql_operation/query/get_channel_messages_operation.dart';
import 'client/graphql_operation/query/get_channel_query_operation.dart';
import 'client/graphql_operation/subscription/subscribe_channel_message_subscription.dart';

@LazySingleton(as: ChannelRemoteApi, env: [Env.PROD, Env.DEV])
class GraphQLChannelRemoteApiImpl implements ChannelRemoteApi {
  final GraphQLClientHelper _client;
  final MessageMapper _messageMapper;
  final ChannelMapper _channelMapper;

  GraphQLChannelRemoteApiImpl(this._client, this._messageMapper, this._channelMapper);

  @override
  Future<Message> createMessage(String channelId, String message, int timestamp) {
    var operation = CreateMessageMutation(message: message, channelId: channelId, timestamp: timestamp);
    return _client
        .mutate(operation)
        .then((json) => MessageModel.fromJson(json["createMessage"]))
        .then(_messageMapper.map);
  }

  @override
  Future<Channel> getChannelById(String id, {int memberLimit = 30}) {
    final operation = GetChannelQuery(id: id, memberLimit: memberLimit);
    return _client.query(operation).then((json) => ChannelModel.fromJson(json['channel'])).then(_channelMapper.map);
  }

  @override
  Future<PaginationResponse<Message>> getChannelMessages(String channelId, int limit, String? cursor) async {
    var operation = GetChannelMessagesQuery(channelId: channelId, lastMessageId: cursor, limit: limit);
    var paginationResult = _client.query(operation).then((json) async {
      var list = (json['messages']['items'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e))
          .map((e) async => _messageMapper.map(e));

      var messages = await Future.wait(list);
      var hasMore = json['messages']['hasMore'] as bool;
      var previousCursor = json['messages']['previousCursor'] as String?;
      var response = PaginationResponse<Message>(items: messages, hasMore: hasMore, cursor: previousCursor);

      return response;
    });

    return paginationResult;
  }

  @override
  Stream<Message> subscribeChannelMessage(String channelId) {
    var operation = SubscribeChannelMessageSubscription(channelId: channelId);
    return _client
        .subscribe(operation)
        .map((result) => result["onNewMessage"])
        .where((notification) => notification['topic'] == "OnMessageCreated")
        .map((json) => MessageModel.fromJson(json['payload']))
        .asyncMap(_messageMapper.map);
  }
}
