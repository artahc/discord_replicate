import 'dart:developer';

import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:rxdart/rxdart.dart' as rx;

class UserQueries {
  UserQueries._();

  static final loadUserById = r"""
    query User($uid: String!) {
      user(uid: $uid) {
        uid
        avatarUrl
        name
        about
        servers {
          id
          name
          imageUrl
          channels {
            id
            name
            access
            room {
              id
            }
          }
        }
      }
    }
  """;
}

class UserRepository {
  static const String BOX_NAME = "user";

  GraphQLClientHelper _api;
  HiveDatabaseHelper _db;

  UserRepository({
    required GraphQLClientHelper apiClient,
    required HiveDatabaseHelper database,
  })  : _api = apiClient,
        _db = database;

  /// Load user by UID.
  ///
  /// Returns user's profile along with servers and channels basic info.
  Future<User> loadUser(String uid) async {
    var box = await _db.getBox<User>(BOX_NAME);

    var varibales = {
      'uid': uid,
    };

    var local = Stream.value(box.get(uid)).where((user) => user != null).doOnData(
      (user) {
        log("User found on local database.", name: this.runtimeType.toString());
      },
    );

    var remote = Stream.fromFuture(
      _api.query(UserQueries.loadUserById, variables: varibales).then((json) => User.fromJson(json['user'])),
    ).doOnError(
      (e, s) {
        log("Error when fetching user from remote : $e");
      },
    ).doOnData(
      (user) async {
        log("User retrieved from remote database.", name: this.runtimeType.toString());
        await box.put(user.uid, user);
      },
    );

    var source = local.concatWith([remote]).doOnError((error, stacktrace) {
      throw FormatException("User not found.", error);
    });

    var user = await source.first;

    return user!;
  }
}
