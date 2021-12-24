import 'dart:developer';

import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:rxdart/rxdart.dart' as rx;

class UserRepository {
  static const String BOX_NAME = "user";

  GraphQLClientHelper _api;
  HiveDatabaseHelper _db;

  UserRepository({
    required GraphQLClientHelper apiClient,
    required HiveDatabaseHelper database,
  })  : _api = apiClient,
        _db = database;

  Future<User> loadById(String uid) async {
    var box = await _db.getBox<LocalUser>(BOX_NAME);
    String query = r"""
        query User($uid: String!) {
          user(uid: $uid) {
            uid
            username
            servers {
              id
              name
              channels {
                roomId
                access
                name
                id
              }
            }
          }
        }
      """;

    var varibales = {
      'uid': uid,
    };

    var local = Stream.value(box.get(uid)).where((user) => user != null).doOnData(
      (user) {
        log("User found on local database.", name: this.runtimeType.toString());
      },
    );

    var remote = Stream.fromFuture(_api.query(query, variables: varibales).then((json) => LocalUser.fromJson(json['user']))).doOnData(
      (user) async {
        log("User retrieved from remote database.", name: this.runtimeType.toString());
        await box.put(user.uid, user);
      },
    );

    var user = await local.concatWith([remote]).first;

    return user!;
  }
}
