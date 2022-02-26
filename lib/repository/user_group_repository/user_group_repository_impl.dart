import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/user_group/user_group.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/repository/user_group_repository/hivedb_usergroup_store.dart';
import 'package:discord_replicate/repository/user_group_repository/inmemory_usergroup_store.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class UserGroupRepositoryImpl extends UserGroupRepository {
  final Logger log = Logger();

  final RemoteApi _api;
  final Store<UserGroup> _db;
  final Store<UserGroup> _cache;

  UserGroupRepositoryImpl({
    RemoteApi? api,
    Store<UserGroup>? database,
    Store<UserGroup>? cache,
  })  : _api = api ?? sl.get<RemoteApi>(),
        _db = database ?? sl.get<HiveUserGroupStore>(),
        _cache = cache ?? sl.get<InMemoryUserGroupStore>();

  @override
  Future<UserGroup> getUserGroup(String id, {int limitMember = 50, String? cursor}) async {
    var memory = LazyStream(() {
      return _cache.load(id).asStream().where((userGroup) => userGroup != null).doOnData((userGroup) {
        log.i("User group found on memory cache. $userGroup");
      });
    });

    var local = LazyStream(() {
      return _db.load(id).asStream().where((userGroup) => userGroup != null).doOnData((userGroup) async {
        await _cache.save(userGroup!);
        log.i("User group found on local database.");
      });
    });

    var remote = LazyStream(() {
      return _api.getUserGroup(id, limitMember, cursor).asStream().asyncMap((paginatedResponse) async {
        var userGroup = UserGroup(id: id, members: paginatedResponse.items.toSplayTreeMap(keyConverter: (e) => e.uid, valueConverter: (e) => e));

        await _cache.save(userGroup);
        await _db.save(userGroup);

        log.i("User group retrieved from remote API. $userGroup");

        return userGroup;
      });
    });

    var result = await ConcatStream([memory, local, remote]).firstWhere((element) => element != null);
    return result!;
  }

  @override
  Future<Member> getMemberByUID(String userGroupId, String uid) async {
    var memory = LazyStream(() {
      return _cache.load(userGroupId).asStream().map((userGroup) => userGroup?.members[uid]);
    });

    var disk = LazyStream(() {
      return _db.load(userGroupId).asStream().map((userGroup) => userGroup?.members[uid]);
    });

    var result = await ConcatStream([memory, disk]).firstWhere((element) => element != null);

    return result!;
  }

  @override
  Future<List<Member>> getAllMember(String userGroupId) async {
    return [];
  }
}
