import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';

class ChannelRepository {
  final GraphQLClientHelper _client;

  ChannelRepository({required GraphQLClientHelper graphqlClient}) : _client = graphqlClient;

  Future<Channel> loadById(String id) async {
    var query = """
      query Channel(\$id: String!) {
        channel(id: \$id) {
          id
          name
        }
      }
    """;

    var json = await _client.query(query, variables: {"id": id});
    return Channel.fromJson(json['channel']);
  }
}
