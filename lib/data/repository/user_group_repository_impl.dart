import 'dart:async';

import 'package:discord_replicate/common/app_extension.dart';
import 'package:discord_replicate/common/app_config.dart';

import 'package:discord_replicate/data/store/store.dart';

import 'package:discord_replicate/common/app_logger.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/model/user_group/user_group.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';

import 'package:async/async.dart';
import 'package:rxdart/rxdart.dart';

class UserGroupRepositoryImpl extends UserGroupRepository {
  final UserGroupRemoteApi _api;
  final Store<UserGroup> _db;
  final Store<UserGroup> _cache;

  UserGroupRepositoryImpl({
    UserGroupRemoteApi? api,
    Store<UserGroup>? database,
    Store<UserGroup>? cache,
  })  : _api = api ?? sl.get(),
        _db = database ?? sl.get(),
        _cache = cache ?? sl.get();

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
      return _api.getUserGroupById(id, limitMember, cursor).asStream().asyncMap((paginatedResponse) async {
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
  Future<Member> getMemberById(String userGroupId, String uid) async {
    var memory = LazyStream(() {
      return _cache.load(userGroupId).asStream().map((userGroup) => userGroup?.members[uid]);
    });

    var disk = LazyStream(() {
      return _db.load(userGroupId).asStream().map((userGroup) => userGroup?.members[uid]);
    });

    var remote = LazyStream(() {
      var stream = _api.getUserGroupById(userGroupId, 30, null).asStream().doOnData((response) async {
        var userGroup = UserGroup(id: userGroupId, members: response.items.toMap(keyConverter: (e) => e.uid, valueConverter: (e) => e));
        await _db.save(userGroup);
        await _cache.save(userGroup);
      }).asyncMap((event) => event.items.where((e) => e.uid == uid).first);
      return stream;
    });

    var result = await ConcatStream([memory, disk, remote]).firstWhere((element) => element != null);

    return result!;
  }

  @override
  Future<List<Member>> getAllMember(String userGroupId) async {
    return [];
  }

  @override
  Future<void> saveMember(String userGroupId, Member member) async {
    var exist = await _db.exist(userGroupId);
    if (exist) {
      var userGroup = await _db.load(userGroupId);
      // await _db.save(userGroup.copyWith(members: userGroup!.members.))
    }

    throw UnimplementedError();
  }

  @override
  Future<void> saveAllMembers(String userGroupId, List<Member> members) {
    throw UnimplementedError();
  }

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }

  @override
  Future<void> deleteAllMembers(String userGroupId, List<String> uids) {
    // TODO: implement deleteAllMembers
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMember(String userGroupId, String uid) {
    // TODO: implement deleteMember
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserGroupById(String userGroupId) async {
    await _cache.delete(userGroupId);
    await _db.delete(userGroupId);
  }
}
