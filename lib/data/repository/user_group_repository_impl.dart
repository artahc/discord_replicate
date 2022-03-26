import 'dart:async';

import 'package:discord_replicate/application/extensions/extensions.dart';
import 'package:discord_replicate/application/config/injection.dart';

import 'package:discord_replicate/data/store/store.dart';

import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';

import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: UserGroupRepository, env: [Env.PROD, Env.DEV])
class UserGroupRepositoryImpl extends UserGroupRepository {
  final UserGroupRemoteApi _api;
  final Store<UserGroup> _db;
  final Store<UserGroup> _cache;

  UserGroupRepositoryImpl(
    this._api,
    @Named("DB_USERGROUP") this._db,
    @Named("CACHE_USERGROUP") this._cache,
  );

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
        var userGroup = UserGroup(
            id: userGroupId, members: response.items.toMap(keyConverter: (e) => e.uid, valueConverter: (e) => e));
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
    throw UnimplementedError();
  }

  @override
  Future<void> saveAllMembers(String userGroupId, List<Member> members) async {
    var userGroup =
        UserGroup(id: userGroupId, members: members.toMap(keyConverter: (e) => e.uid, valueConverter: (e) => e));
    await _db.save(userGroup);
    await _cache.save(userGroup);
  }

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }

  @override
  Future<void> deleteAllMembers(String userGroupId, List<String> uids) {
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
