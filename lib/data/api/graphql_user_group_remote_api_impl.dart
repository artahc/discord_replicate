import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/mapper/member_mapper.dart';
import 'package:discord_replicate/data/model/member_model.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:injectable/injectable.dart';

import 'client/graphql_operation/query/get_usergroup_operation.dart';

@LazySingleton(as: UserGroupRemoteApi, env: [Env.PROD, Env.DEV])
class GraphQLUserGroupRemoteApiImpl implements UserGroupRemoteApi {
  final GraphQLClientHelper _client;
  final MemberMapper _memberMapper;

  GraphQLUserGroupRemoteApiImpl(this._client, this._memberMapper);

  @override
  Future<PaginationResponse<Member>> getUserGroupById(String id, int limitMember, String? cursor) {
    var operation = GetUserGroupQuery(userGroupId: id, limit: limitMember, cursor: cursor);
    return _client.query(operation).then((json) {
      var raw = json['userGroup']['items'] as List<Object?>;
      var hasMore = json['userGroup']['hasMore'] as bool;
      var models = raw.map((e) => MemberModel.fromJson(e as Map<String, dynamic>));

      return Future.wait(models.map((e) async => _memberMapper.map(e))).then(
        (members) => PaginationResponse(
          hasMore: hasMore,
          items: members,
          cursor: cursor,
        ),
      );
    });
  }
}
