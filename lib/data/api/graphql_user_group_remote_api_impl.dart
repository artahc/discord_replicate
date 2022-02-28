import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/common/graphql/graphql_client_helper.dart';
import 'package:discord_replicate/common/graphql/graphql_operation/graphql_operation.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/member/member.dart';

class GraphQLUserGroupRemoteApiImpl implements UserGroupRemoteApi {
  final GraphQLClientHelper _client;

  GraphQLUserGroupRemoteApiImpl({GraphQLClientHelper? client}) : _client = client ?? sl.get();

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
