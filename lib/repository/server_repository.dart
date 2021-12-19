import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';

class ServerRepository {
  final GraphQLClientHelper _client;

  ServerRepository({required GraphQLClientHelper apiClient}) : _client = apiClient;

  Future<List<Server>> loadAll() async {
    var query = r"""
      query Servers {
        servers {
          id
          name
          channels {
            id
            name
            roomId
            access
          }  
        }
      }
    """;

    var json = await _client.query(query);
    var servers = (json['servers'] as List<Object?>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList();
    return servers;
  }

  Future<Server> loadById(String id) async {
    var query = """
      query Server(\$id: String!) {
        server(id: \$id) {
          id
          name
          channels {
            id
            name
            roomId
            access
          }
        }
      }
    """;

    var json = await _client.query(query, variables: {"id": id});
    return Server.fromJson(json['server']);
  }
}
