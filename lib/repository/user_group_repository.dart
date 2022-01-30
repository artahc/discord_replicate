import 'dart:collection';

import 'package:async/async.dart';
import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/member.dart';
import 'package:discord_replicate/model/user_group.dart';
import 'package:discord_replicate/repository/repository_interface.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class UserGroupQuery {
  UserGroupQuery._();

  static const loadUserGroupById = r"""
    query ExampleQuery($userGroupRef: String!) {
      userGroup(userGroupRef: $userGroupRef) {
        uid
        name
        avatarUrl
      }
    }
  """;
}

class UserGroupRepository extends Repository<UserGroup> {
  final Logger log = Logger();
  GraphQLClientHelper _api;
  DatabaseService _db;
  HashMap<String, UserGroup> _cache = new HashMap();

  UserGroupRepository({GraphQLClientHelper? client, DatabaseService? database})
      : _api = client ?? GetIt.I.get<GraphQLClientHelper>(),
        _db = database ?? GetIt.I.get<DatabaseService>();

  @override
  Future<UserGroup?> load(String id) async {
    var memory = LazyStream(() {
      UserGroup? cachedUserGroup;
      if (_cache.containsKey(id)) cachedUserGroup = _cache[id];

      return Stream.value(cachedUserGroup).where((event) => event != null).doOnData((event) {
        log.d("User group found on cache memory");
      });
    });

    var local = LazyStream(() {
      return _db
          .load<UserGroup>(id)
          .then((userGroup) {
            if (userGroup != null) {
              _cache[userGroup.id] = userGroup;
            }
          })
          .asStream()
          .doOnData((event) {
            log.d("User group found on local database.");
          });
    });

    var remote = LazyStream(() {
      var variables = {
        "userGroupRef": id,
      };
      return _api
          .query(UserGroupQuery.loadUserGroupById, variables: variables)
          .then((json) async {
            var raw = json['userGroup'] as List<Object?>;
            var members = raw.map((e) => Member.fromJson(e as Map<String, dynamic>)).toList();
            var userGroup = UserGroup(
              id: id,
              members: members.toKeyValuePair(
                keyConverter: (e) => e.uid,
                valueConverter: (member) => member,
              ),
            );

            await save(userGroup);
            return userGroup;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream();
    });

    var result = await ConcatStream([memory, local, remote]).firstWhere((element) => element != null);
    return result;
  }

  @override
  Future<List<UserGroup>> loadAll() {
    throw UnimplementedError();
  }

  @override
  Exception mapException(Exception e) {
    throw UnimplementedError();
  }

  @override
  Future<void> save(UserGroup userGroup) async {
    _cache[userGroup.id] = userGroup;
    await _db.save(userGroup.id, userGroup);
  }

  @override
  Future<void> saveAll(List<UserGroup> items) {
    throw UnimplementedError();
  }
}
