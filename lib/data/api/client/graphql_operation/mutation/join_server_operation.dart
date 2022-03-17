import '../graphql_operation.dart';

class JoinServerMutation implements GraphQLOperation {
  final String serverId;

  JoinServerMutation({required this.serverId});

  @override
  String get operation => r"""
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
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "serverRef": serverId,
    };
  }
}
