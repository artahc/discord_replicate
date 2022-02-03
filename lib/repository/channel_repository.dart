import 'dart:collection';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/repository/repository_interface.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class ChannelQuery {
  ChannelQuery._();

  static final String loadChannelById = r"""
    query Channel($id: String!) {
      channel(id: $id) {
        id
        name
        userGroupRef
      }
    }
  """;

  static final String loadChannelMessages = r"""
    query ChannelMessages ($channelRef: String!) {
      messages(channelRef: $channelRef) {
        id
        senderRef
        timestamp
        message
      }
    }
  """;
}

abstract class ChannelRepository extends Repository<Channel> {
  Future<RawMessage> sendMessage(String channelId, Message message);
  Future<List<RawMessage>> fetchMessages(String channelId);
  Stream<RawMessage> subscribeChannelMessages(String channelId);
}

class ChannelRepositoryImpl implements ChannelRepository {
  late Logger log = Logger();

  GraphQLClientHelper _api;
  DatabaseService _db;
  HashMap<String, Channel> _cache = new HashMap();

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
        //log.d("Channel found on memory cache");
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
            //log.d("Channel found on local database.");
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
            //log.d("Channel retrieved from remote API.");
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

    log.d("Sending message");
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
  Future<List<RawMessage>> fetchMessages(String channelId) async {
    var variables = {
      "channelRef": channelId,
    };

    var messages = await _api.query(ChannelQuery.loadChannelMessages, variables: variables).then((json) {
      var rawList = json['messages'] as List<Object?>;
      var rawMessages = rawList.map((element) => RawMessage.fromJson(element as Map<String, dynamic>));
      return rawMessages.toList();
    });

    return messages;
  }

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) {
      return NotFoundException("Room not found in remote API.", source: e);
    }
    return e;
  }

  @override
  Future<void> dispose() async {
    this._cache.clear();
  }
}
