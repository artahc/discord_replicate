import 'package:discord_replicate/common/config/app_config.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/mutation/join_server_operation.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/mutation/leave_server_operation.dart';
import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:discord_replicate/domain/model/server.dart';

import 'client/graphql_operation/query/get_server_operation.dart';

class GraphQLServerRemoteApiImpl implements ServerRemoteApi {
  final GraphQLClientHelper _client;

  GraphQLServerRemoteApiImpl({GraphQLClientHelper? client}) : _client = client ?? sl.get();

  @override
  Future<Server> getServerById(String id) {
    var operation = GetServerQuery(id: id);
    return _client.query(operation).then((json) => Server.fromJson(json['server']));
  }

  @override
  Future<Server> joinServer(String serverId) {
    var operation = JoinServerMutation(serverId: serverId);
    return _client.query(operation).then((value) => Server.fromJson(value['joinServer']));
  }

  @override
  Future<void> leaveServer(String serverId) async {
    var operation = LeaverServerMutation(serverId: serverId);
    return _client.query(operation).then((value) => null);
  }
}
