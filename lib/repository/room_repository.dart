import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';

class RoomRepository {
  static const String BOX_NAME = "room";

  GraphQLClientHelper _api;
  HiveDatabaseHelper _db;

  RoomRepository({
    required GraphQLClientHelper apiClient,
    required HiveDatabaseHelper database,
  })  : _api = apiClient,
        _db = database;

  Future<Room> loadRoom(String id) async {
    return Room.dummy();
  }
}
