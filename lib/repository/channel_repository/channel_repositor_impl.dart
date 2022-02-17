import 'dart:async';
import 'dart:collection';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/model/paginated_response.dart';
import 'package:discord_replicate/repository/repository.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  late Logger log = Logger();

  GraphQLClientHelper _api;
  DatabaseService _db;
  SplayTreeMap<String, Channel> _cache = new SplayTreeMap();

  ChannelRepositoryImpl({
    GraphQLClientHelper? apiClient,
    DatabaseService? database,
  })  : _api = apiClient ?? GetIt.I.get<GraphQLClientHelper>(),
        _db = database ?? GetIt.I.get<DatabaseService>();

  @override
  Future<Channel?> load(String id) async {
    var query = ChannelQuery.loadChannelById;
    var variables = {
      "id": id,
      "memberLimit": 30,
    };

    var memory = LazyStream(() {
      Channel? cachedChannel;
      if (_cache.containsKey(id)) cachedChannel = _cache[id];

      return Stream.value(cachedChannel).where((user) => user != null).doOnData((user) {
        //log.i("Channel found on memory cache");
      });
    });

    var local = LazyStream(() {
      return _db
          .load<Channel>(id)
          .then((channel) {
            if (channel != null) _cache[channel.id] = channel;
            return channel;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .where((event) => event != null)
          .doOnData((event) {
            //log.i("Channel found on local database.");
          });
    });

    var remote = LazyStream(() {
      return _api
          .query(query, variables: variables)
          .then((json) async {
            var channel = Channel.fromJson(json['channel']);
            await save(channel);
            return channel;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .doOnData((channel) {
            //log.i("Channel retrieved from remote API.");
          });
    });

    var result = await ConcatStream([memory, local, remote]).firstWhere((element) => element != null);
    return result!;
  }

  @override
  Future<List<Channel>> loadAll() async {
    var result = await _db.loadAll<Channel>();
    return result;
  }

  @override
  Future<void> save(Channel channel) async {
    _cache[channel.id] = channel;
    await _db.save(channel.id, channel);
  }

  @override
  Future<void> saveAll(List<Channel> items) async {
    var keyValuePair = items.toMap<String, Channel>(keyConverter: (e) => e.id, valueConverter: (e) => e);
    _cache.addAll(keyValuePair);
    await _db.saveAll<Channel>(keyValuePair);
  }

  @override
  Future<RawMessage> sendMessage(String channelId, Message message) async {
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

    return await _api.mutate(mutation, variables: variables).then((json) => RawMessage.fromJson(json["createMessage"]));
  }

  @override
  Stream<RawMessage> subscribeChannelMessages(String channelId) async* {
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
        .map((json) => RawMessage.fromJson(json['payload']));
  }

  @override
  Future<PaginationResponse<RawMessage>> fetchMessages(String channelId, int limit, String? lastMessageId) async {
    var query = r"""
      query Messages($channelRef: String!, $cursor: String, $limit: Int!) {
        messages(channelRef: $channelRef, cursor: $cursor, limit: $limit) {
          items {
            id
            senderRef
            timestamp
            message
          }
          hasMore
          previousCursor
        }
      }
    """;

    var variables = {
      "channelRef": "PkM6m7lhnvIORIRuoVJv",
      "cursor": lastMessageId,
      "limit": limit,
    };

    var paginationResult = await _api.query(query, variables: variables).then((json) {
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
  Exception mapException(Exception e) {
    if (e is NotFoundException) {
      return NotFoundException("Room not found in remote API.", source: e);
    }
    return e;
  }

  @override
  FutureOr onDispose() {
    _cache.clear();
  }
}
