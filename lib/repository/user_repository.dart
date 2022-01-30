import 'dart:async';
import 'dart:collection';

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
          userGroupRef
        }
        servers {
          id
          name
          imageUrl
          userGroupRef
          channels {
            id
            name
            userGroupRef
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
  HashMap<String, User> _cache = new HashMap();

  UserRepository({
    GraphQLClientHelper? apiClient,
    DatabaseService? database,
  })  : _api = apiClient ?? GetIt.I.get<GraphQLClientHelper>(),
        _db = database ?? GetIt.I.get<DatabaseService>();

  @override
  Future<User?> load(String uid) async {
    var query = UserQuery.loadById;
    var varibales = {
      'uid': uid,
    };

    var memory = LazyStream(() {
      User? cachedUser;
      if (_cache.containsKey(uid)) cachedUser = _cache[uid];

      return Stream.value(cachedUser).where((user) => user != null).doOnData((user) {
        log.d("User found on memory cache");
      });
    });

    var local = LazyStream(() {
      return _db
          .load<User>(uid)
          .then((user) {
            if (user != null) {
              _cache[user.uid] = user;
            }
            return user;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .where((user) => user != null)
          .doOnData((event) {
            log.d("User found on local database.");
          });
    });

    var remote = LazyStream(() {
      return _api
          .query(query, variables: varibales)
          .then((json) async {
            var user = User.fromJson(json['user']);
            await save(user);
            return user;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .doOnData((user) {
            log.d("User retrieved from remote API. $user");
          });
    });

    var result = await ConcatStream([memory, local, remote]).first;
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
    var keyValue = users.toKeyValuePair(keyConverter: (e) => e.uid, valueConverter: (e) => e);
    await _db.saveAll(keyValue);
  }

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) return NotFoundException("User not found.", source: e);
    return e;
  }
}
