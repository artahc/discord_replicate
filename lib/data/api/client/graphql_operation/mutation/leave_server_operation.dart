import '../../graphql_operation.dart';

class LeaverServerOperation implements GraphQLOperation {
  final String serverId;

  LeaverServerOperation({required this.serverId});

  @override
  String get operation => r"""
    mutation LeaveServer($serverRef: String!) {
      leaveServer(serverRef: $serverRef)
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "serverId": serverId,
    };
  }
}
