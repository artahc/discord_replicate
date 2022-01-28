import 'package:discord_replicate/model/member.dart';
import 'package:discord_replicate/model/user_group.dart';
import 'package:discord_replicate/repository/repository_interface.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:get_it/get_it.dart';

class UserGroupRepository extends Repository<UserGroup> {
  GraphQLClientHelper _api;
  DatabaseService _db;

  UserGroupRepository({GraphQLClientHelper? client, DatabaseService? database})
      : _api = client ?? GetIt.I.get<GraphQLClientHelper>(),
        _db = database ?? GetIt.I.get<DatabaseService>();

  @override
  Future<UserGroup> load(String id) async {
    var userGroup = await _db.load<UserGroup>(id);
    if (userGroup == null) throw Exception("User group with id $id not found.");

    return userGroup;
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
  Future<void> save(UserGroup item) async {
    var exist = await _db.exist<UserGroup>(item.id);
    if (exist) {
      var userGroup = await _db.load<UserGroup>(item.id);
      userGroup!.members.addAll(item.members);
      await _db.save(userGroup.id, userGroup);
    } else {
      await _db.save(item.id, item);
    }
  }

  @override
  Future<void> saveAll(List<UserGroup> items) {
    throw UnimplementedError();
  }
}
