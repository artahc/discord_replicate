import '../graphql_operation.dart';

class LeaverServerMutation extends GraphQLOperation {
  final String serverId;

  LeaverServerMutation({required this.serverId})
      : super(
          operation: r"""
            mutation LeaveServer($serverRef: String!) {
              leaveServer(serverRef: $serverRef)
            }
          """,
          variables: {
            "serverId": serverId,
          },
        );
}
