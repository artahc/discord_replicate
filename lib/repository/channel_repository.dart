import 'dart:developer';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:rxdart/rxdart.dart';

class ChannelQuery {
  ChannelQuery._();

  static final String loadById = r"""
    query Channel($id: String!, $messageLimit: Int, $memberLimit: Int) {
      channel(id: $id) {
        id
        name
        members(limit: $memberLimit) {
          uid
          avatarUrl
          name
        }
        messages(limit: $messageLimit) {
          id
          senderRef
          timestamp
          message
        }
      }
    }

  """;
}

class ChannelMutation {
  ChannelMutation._();

  static String createMessage = "";
}

class ChannelRepository with ExceptionMapperMixin {
  GraphQLClientHelper _api;
  HiveDatabaseService _db;

  ChannelRepository({
    required GraphQLClientHelper apiClient,
    required HiveDatabaseService database,
  })  : _api = apiClient,
        _db = database;

  Future<Channel> load(String id) async {
    var query = ChannelQuery.loadById;
    var variables = {
      "id": id,
      "messageLimit": 10,
      "memberLimit": 30,
    };

    var local = LazyStream(() {
      return _db
          .load<Channel>(id)
          .then((channel) {
            if (channel != null) log("Channel found on local database. $channel", name: runtimeType.toString());
            return channel;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .where((channel) => channel != null);
    });

    var remote = LazyStream(() {
      return _api.query(query, variables: variables).then((json) {
        var channel = Channel.fromJson(json['channel']);
        _db.save<Channel>(channel.id, channel);
        log("Channel retrieved from remote API. $json", name: runtimeType.toString());
        return channel;
      }).asStream();
    });

    var result = await ConcatStream([local, remote]).firstWhere((element) => element != null);
    return result!;
  }

  Future<void> save(Channel channel) async {}

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) {
      return NotFoundException("Room not found in remote API.", source: e);
    }
    return e;
  }
}
