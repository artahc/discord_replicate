import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:discord_replicate/domain/model/server/server.dart';

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
    throw UnimplementedError();
  }

  @override
  Future<Server> leaveServer(String serverId) {
    // TODO: implement leaveServer
    throw UnimplementedError();
  }
}
