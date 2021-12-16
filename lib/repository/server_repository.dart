import 'dart:developer';
import 'dart:math' as math;

import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';

class ServerRepository {
  final GraphQLClientHelper _client;

  ServerRepository({required GraphQLClientHelper graphQLClient}) : _client = graphQLClient;

  Future<List<Server>> loadAll() async {
    var query = r"""
      query Servers {
        servers {
          id
          name
          channels {
            id
            name
          }  
        }
      }
    """;

    var raw = await _client.query(query);
    var servers = (raw['servers'] as List<Object?>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList();
    return servers;
  }

  Future<Server> loadById(String id) async {
    return Server.dummy(100);
  }
}
