import 'dart:developer';

import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:rxdart/rxdart.dart' as rx;

class UserRepository {
  final String BOX_NAME = "user";

  GraphQLClientHelper _api;
  HiveDatabaseHelper _db;

  UserRepository({
    required GraphQLClientHelper apiClient,
    required HiveDatabaseHelper dbHelper,
  })  : _api = apiClient,
        _db = dbHelper;

  Future<User> loadById(String uid) async {
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
    var box = await _db.getBox(BOX_NAME);

    var local = Stream.value(box.get(uid)).doOnData((user) {
      if (user != null) log("User found on local database.", name: this.runtimeType.toString());
    });
    var remote = Stream.fromFuture(_api.query(query, variables: varibales).then((json) => User.fromJson(json['user']))).doOnData(
      (user) async {
        log("User retrieved from remote database.", name: this.runtimeType.toString());
        await box.put(user.uid, user);
      },
    );

    var user = await local.concatWith([remote]).firstWhere((e) => e != null);

    if (user == null) {
      throw Exception("User not found.");
    } else {
      return user;
    }
  }
}
