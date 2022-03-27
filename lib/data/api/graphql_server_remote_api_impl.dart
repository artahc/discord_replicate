import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/mutation/join_server_operation.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/mutation/leave_server_operation.dart';
import 'package:discord_replicate/data/mapper/server_mapper.dart';
import 'package:discord_replicate/data/model/server_model.dart';
import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:injectable/injectable.dart';

import 'client/graphql_operation/query/get_server_operation.dart';

@LazySingleton(as: ServerRemoteApi, env: [Env.PROD, Env.DEV])
class GraphQLServerRemoteApiImpl implements ServerRemoteApi {
  final GraphQLClientHelper _client;
  final ServerMapper _serverMapper;

  GraphQLServerRemoteApiImpl(this._client, this._serverMapper);

  @override
  Future<Server> getServerById(String id) {
    var operation = GetServerQuery(id: id);
    return _client
        .query(operation)
        .then((json) => ServerModel.fromJson(json['server']))
        .then((model) => _serverMapper.map(model));
  }

  @override
  Future<Server> joinServer(String serverId) {
    var operation = JoinServerMutation(serverId: serverId);
    return _client
        .query(operation)
        .then((json) => ServerModel.fromJson(json['joinServer']))
        .then((model) => _serverMapper.map(model));
  }

  @override
  Future<void> leaveServer(String serverId) async {
    var operation = LeaverServerMutation(serverId: serverId);
    return _client.query(operation).then((value) => null);
  }
}
