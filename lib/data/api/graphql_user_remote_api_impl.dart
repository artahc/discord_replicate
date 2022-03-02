import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/common/graphql/graphql_client_helper.dart';
import 'package:discord_replicate/common/graphql/graphql_operation/graphql_operation.dart';
import 'package:discord_replicate/domain/api/user_remote_api.dart';
import 'package:discord_replicate/domain/model/user/user.dart';

class GraphQLUserRemoteApiImpl implements UserRemoteApi {
  final GraphQLClientHelper _client;

  GraphQLUserRemoteApiImpl({GraphQLClientHelper? client}) : _client = client ?? sl.get();

  @override
  Future<User> getUserById(String userId) {
    var operation = GetUserQuery(uid: userId);
    return _client.query(operation).then((json) => User.fromJson(json['user']));
  }
}