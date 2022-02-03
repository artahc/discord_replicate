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
    query UserGroup($userGroupRef: ID!, $limit: Int!, $cursor: String) {
      userGroup(userGroupRef: $userGroupRef, limit: $limit, cursor: $cursor) {
        items {
          uid
          name
          avatarUrl
        }
        hasMore
      }
    }
  """;
}

class PaginationResponse<T> {
  final List<T> items;
  final bool hasMore;

  const PaginationResponse({required this.items, required this.hasMore});
}

abstract class UserGroupRepository extends Repository<UserGroup> {
  Future<PaginationResponse<Member>> loadBatch(String id, int limit, String? lastMemberId);
}

class UserGroupRepositoryImpl extends UserGroupRepository {
  final Logger log = Logger();
  GraphQLClientHelper _api;
  DatabaseService _db;
  SplayTreeMap<String, UserGroup> _cache = new SplayTreeMap();

  UserGroupRepositoryImpl({GraphQLClientHelper? client, DatabaseService? database})
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
              cache(userGroup);
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
        "limit": 50,
        "cursor": null,
      };
      return _api
          .query(UserGroupQuery.loadUserGroupById, variables: variables)
          .then((json) async {
            var raw = json['userGroup']['items'] as List<Object?>;
            var members = raw.map((e) => Member.fromJson(e as Map<String, dynamic>)).toList();
            var userGroup = UserGroup(
              id: id,
              members: members.toMap(
                keyConverter: (e) => e.uid,
                valueConverter: (member) => member,
              ),
            );

            await save(userGroup);
            return userGroup;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .doOnData((event) {
            log.d("User group retrieved from remote API.");
          });
    });

    var result = await ConcatStream([memory, local, remote]).firstWhere((element) => element != null);
    return result;
  }

  @override
  Future<List<UserGroup>> loadAll() {
    throw UnimplementedError();
  }

  void cache(UserGroup userGroup) {
    if (_cache.containsKey(userGroup)) {
      _cache[userGroup.id]!.members.addAll(userGroup.members);
    } else {
      _cache[userGroup.id] = userGroup;
    }
  }

  @override
  Future<void> save(UserGroup userGroup) async {
    cache(userGroup);

    var existingEntry = await _db.load<UserGroup>(userGroup.id);
    if (existingEntry != null) {
      existingEntry.members.addAll(userGroup.members);
      await _db.save(userGroup.id, existingEntry);
    } else {
      await _db.save(userGroup.id, userGroup);
    }
  }

  @override
  Future<void> saveAll(List<UserGroup> userGroups) async {
    throw UnimplementedError();
  }

  @override
  Future<PaginationResponse<Member>> loadBatch(String id, int limit, String? lastMemberId) async {
    var variables = {
      "userGroupRef": id,
      "limit": limit,
      "cursor": lastMemberId,
    };
    var response = _api.query(UserGroupQuery.loadUserGroupById, variables: variables).then((json) async {
      var raw = json['userGroup']['items'] as List<Object?>;
      var members = raw.map((e) => Member.fromJson(e as Map<String, dynamic>)).toList();
      var hasMore = json['hasMore'] as bool;
      var userGroup = UserGroup(
        id: id,
        members: members.toSplayTreeMap(
          keyConverter: (e) => e.uid,
          valueConverter: (member) => member,
        ),
      );

      await save(userGroup);

      return PaginationResponse<Member>(items: members, hasMore: hasMore);
    });

    return response;
  }

  @override
  Exception mapException(Exception e) {
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() async {
    this._cache.clear();
  }
}
