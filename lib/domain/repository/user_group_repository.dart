import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:get_it/get_it.dart';

abstract class UserGroupRepository implements Disposable {
  Future<void> saveMember(String userGroupId, Member member);
  Future<void> saveAllMembers(String userGroupId, List<Member> members);
  Future<Member> getMemberById(String userGroupId, String uid);
  Future<List<Member>> getAllMember(String userGroupId);

  Future<void> deleteMember(String userGroupId, String uid);
  Future<void> deleteAllMembers(String userGroupId, List<String> uids);

  Stream<ObservableEntityEvent<String, Member>> observeChanges(String userGroupId);
}
