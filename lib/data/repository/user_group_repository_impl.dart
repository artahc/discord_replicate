import 'dart:async';

import 'package:async/async.dart';
import 'package:custom_extension/custom_extensions.dart';
import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: UserGroupRepository, env: [Env.PROD, Env.DEV])
class UserGroupRepositoryImpl extends UserGroupRepository {
  final UserGroupRemoteApi _api;
  final Store<String, UserGroup> _db;
  final Store<String, UserGroup> _cache;

  UserGroupRepositoryImpl(
    this._api,
    @Named("DB_USERGROUP") this._db,
    @Named("CACHE_USERGROUP") this._cache,
  );

  @override
  Future<Member> getMemberById(String userGroupId, String uid) async {
    var cache = LazyStream(() {
      return Future.sync(() => _cache.load(userGroupId))
          .asStream()
          .map((userGroup) => userGroup?.members[uid])
          .where((event) => event != null);
    });

    var db = LazyStream(() {
      return Future.sync(() => _db.load(userGroupId))
          .asStream()
          .map((userGroup) => userGroup?.members[uid])
          .where((event) => event != null);
    });

    var remote = LazyStream(() {
      return _api.getUserGroupById(userGroupId, 30, null).asStream().asyncMap((response) async {
        var userGroup = UserGroup.fromMembers(id: userGroupId, members: response.items);
        await _db.save(userGroup.id, userGroup);
        await _cache.save(userGroup.id, userGroup);

        return response.items;
      }).map((members) => members.firstWhere((element) => element.uid == uid));
    });

    var result = await ConcatStream([cache, db, remote]).firstWhere((element) => element != null);

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
    await _db.save(userGroup.id, userGroup);
    await _cache.save(userGroup.id, userGroup);
  }

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }

  @override
  Future<void> deleteAllMembers(String userGroupId, List<String> uids) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMember(String userGroupId, String uid) {
    throw UnimplementedError();
  }

  @override
  Stream<ObservableEntityEvent<String, Member>> observeChanges(String userGroupId) {
    throw UnimplementedError();
  }
}
