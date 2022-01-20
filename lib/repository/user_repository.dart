import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/exception/mixin_error_mapper.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:logger/logger.dart';
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
        privateChannels {
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
          }
        }
      }
    }
  """;
}

class UserRepository with ExceptionMapperMixin {
  late Logger log = Logger();

  GraphQLClientHelper _api;
  HiveDatabaseService _db;

  User? _currentUser;

  UserRepository({
    required GraphQLClientHelper apiClient,
    required HiveDatabaseService database,
  })  : _api = apiClient,
        _db = database;

  User? getCurrentUser() {
    return _currentUser;
  }

  Future<void> setCurrentUser(User user) async {
    this._currentUser = user;
  }

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
          .load<User>(uid)
          .then((user) {
            if (user != null) log.d("User found on local database. $user");
            return user;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .where((user) => user != null);
    });

    var remote = LazyStream(() {
      return _api
          .query(query, variables: varibales)
          .then((json) async {
            var user = User.fromJson(json['user']);
            await save(user);
            log.d("User retrieved from remote API. $user");
            return user;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream();
    });

    var result = await ConcatStream([local, remote]).first;
    return result!;
  }

  Future save(User user) async {
    await _db.save<User>(user.uid, user);
  }

  Exception mapException(Exception e) {
    if (e is NotFoundException) return NotFoundException("User not found.", source: e);
    return e;
  }
}
