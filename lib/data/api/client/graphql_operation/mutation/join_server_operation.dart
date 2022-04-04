import 'package:discord_replicate/data/api/client/graphql_operation/graphql_operation.dart';

class JoinServerMutation extends GraphQLOperation {
  final String serverId;

  JoinServerMutation({required this.serverId})
      : super(
          operation: r"""
            mutation JoinServer($serverRef: String!) {
              joinServer(serverRef: $serverRef) {
                id
                name
                imageUrl
                userGroupRef
                channels {
                  id
                  name
                  userGroupRef
                }
              }
            }
          """,
          variables: {
            "serverRef": serverId,
          },
        );
}
