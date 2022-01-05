import 'dart:developer';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:rxdart/rxdart.dart';

class RoomQuery {
  RoomQuery._();

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

class RoomRepository with ExceptionMapperMixin {
  static const String BOX_NAME = "room";

  GraphQLClientHelper _api;
  HiveDatabaseHelper _db;

  RoomRepository({
    required GraphQLClientHelper apiClient,
    required HiveDatabaseHelper database,
  })  : _api = apiClient,
        _db = database;

  Future<Room> load(String id) async {
    var query = RoomQuery.loadById;
    var variables = {
      "id": id,
      "messageLimit": 2,
      "memberLimit": 2,
    };
    var remote = LazyStream(() {
      return _api.query(query, variables: variables).then((json) {
        var room = Room.fromJson(json['room']);
        //todo: save into local database
        log("Room retrieved from remote API. $json", name: runtimeType.toString());
        return room;
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
