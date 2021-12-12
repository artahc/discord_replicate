import 'package:discord_replicate/util/graphql_client_helper.dart';

class ChannelRepository {
  final GraphQLClientHelper _graphqlClient;

  ChannelRepository({required GraphQLClientHelper graphqlClient}) : _graphqlClient = graphqlClient;
}
