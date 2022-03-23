import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:injectable/injectable.dart';

import 'client/graphql_operation/query/get_usergroup_operation.dart';

@LazySingleton(as: UserGroupRemoteApi, env: [Env.PROD, Env.DEV])
class GraphQLUserGroupRemoteApiImpl implements UserGroupRemoteApi {
  final GraphQLClientHelper _client;

  GraphQLUserGroupRemoteApiImpl(this._client);

  @override
  Future<PaginationResponse<Member>> getUserGroupById(String id, int limitMember, String? cursor) {
    var operation = GetUserGroupQuery(userGroupId: id, limit: limitMember, cursor: cursor);
    return _client.query(operation).then((json) {
      var raw = json['userGroup']['items'] as List<Object?>;
      var hasMore = json['userGroup']['hasMore'] as bool;
      var members = raw.map((e) => Member.fromJson(e as Map<String, dynamic>)).toList();

      return PaginationResponse(items: members, hasMore: hasMore);
    });
  }
}
