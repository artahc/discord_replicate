import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/mapper/user_mapper.dart';
import 'package:discord_replicate/data/model/user_model.dart';
import 'package:discord_replicate/domain/api/user_remote_api.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:injectable/injectable.dart';

import 'client/graphql_operation/query/get_user_operation.dart';

@LazySingleton(as: UserRemoteApi, env: [Env.PROD, Env.DEV])
class GraphQLUserRemoteApiImpl implements UserRemoteApi {
  final GraphQLClientHelper _client;
  final UserMapper _userMapper;

  GraphQLUserRemoteApiImpl(this._client, this._userMapper);

  @override
  Future<User> getUserById(String userId) {
    var operation = GetUserQuery(uid: userId);
    return _client.query(operation).then((json) => UserModel.fromJson(json['user'])).then(_userMapper.map);
  }
}
