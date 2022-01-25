import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/repository_interface.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:get_it/get_it.dart';
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

class UserRepository implements Repository<User> {
  late Logger log = Logger();

  GraphQLClientHelper _api;
  DatabaseService _db;

  UserRepository({
    GraphQLClientHelper? apiClient,
    DatabaseService? database,
  })  : _api = apiClient ?? GetIt.I.get<GraphQLClientHelper>(),
        _db = database ?? GetIt.I.get<DatabaseService>();

  @override
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

  @override
  Future<List<User>> loadAll() async {
    var result = await _db.loadAll<User>();
    return result;
  }

  @override
  Future<void> save(User user) async {
    await _db.save<User>(user.uid, user);
  }

  @override
  Future<void> saveAll(List<User> users) async {
    var keyValue = users.toKeyValuePair((e) => e.uid, (e) => e);
    await _db.saveAll(keyValue);
  }

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) return NotFoundException("User not found.", source: e);
    return e;
  }
}
