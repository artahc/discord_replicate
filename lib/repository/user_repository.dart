import 'dart:async';
import 'dart:developer';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:rxdart/rxdart.dart';

class UserQuery {
  UserQuery._();

  static final loadById = r"""
    query User($uid: String!) {
      user(uid: $uid) {
        uid
        avatarUrl
        name
        about
        privateRooms {
          id
          name
          members {
            uid
            name
            avatarUrl
          }
        }
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

  // factory UserQuery.loadUserById(String uid) = Query();
}

class UserRepository with ExceptionMapperMixin {
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
  Future<User> load(String uid) async {
    var query = UserQuery.loadById;
    var varibales = {
      'uid': uid,
    };

    var local = LazyStream(() {
      return _db
          .get<User>(HiveConstants.USER_BOX, uid)
          .then((user) {
            if (user != null) log("User found on local database. $user", name: runtimeType.toString());
            return user;
          })
          .asStream()
          .where((user) => user != null);
    });

    var remote = LazyStream(() {
      return _api
          .query(query, variables: varibales)
          .then((json) async {
            var user = User.fromJson(json['user']);
            await save(user);
            log("User retrieved from remote API. $user", name: runtimeType.toString());
            return user;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream();
    });

    var result = await ConcatStream([local, remote]).first;
    return result!;
  }

  Future save(User user) async {
    await _db.put(HiveConstants.USER_BOX, user.uid, user);
  }

  Exception mapException(Exception e) {
    if (e is NotFoundException) return NotFoundException("User not found.", source: e);
    return e;
  }
}
