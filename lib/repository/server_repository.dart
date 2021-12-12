import 'dart:math';

import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';

class ServerRepository {
  final GraphQLClientHelper _graphqlClient;

  ServerRepository({required GraphQLClientHelper graphQLClient}) : _graphqlClient = graphQLClient;

  Future<List<Server>> loadAll() async {
    return List.generate(10, (index) => Server.dummy(Random().nextInt(10000)));
  }

  Future<Server> loadById(String id) async {
    return Server.dummy(100);
  }
}
