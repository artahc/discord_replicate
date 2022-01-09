import 'dart:developer';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:rxdart/rxdart.dart';

class ChannelQuery {
  ChannelQuery._();

  static final String loadById = r"""
    query Room($id: String!, $messageLimit: Int, $memberLimit: Int) {
      room(id: $id) {
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

class ChannelRepository with ExceptionMapperMixin {
  static const String BOX_NAME = "room";

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
      "messageLimit": 2,
      "memberLimit": 2,
    };
    var remote = LazyStream(() {
      return _api.query(query, variables: variables).then((json) {
        var channel = Channel.fromJson(json['room']);
        //todo: save into local database
        log("Room retrieved from remote API. $json", name: runtimeType.toString());
        return channel;
      }).asStream();
    });

    var result = await ConcatStream([remote]).first;
    return result;
  }

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) {
      return NotFoundException("Room not found in remote API.", source: e);
    }
    return e;
  }
}
