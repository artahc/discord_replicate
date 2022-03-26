import '../graphql_operation.dart';

class GetChannelQuery extends GraphQLOperation {
  final String id;
  final int memberLimit;

  GetChannelQuery({required this.id, required this.memberLimit});

  @override
  String get operation => r"""
    query Channel($channelId: String!, $limit: Int) {
      channel(id: $channelId) {
        id
        name
        userGroupRef
        messages {
          id
          senderRef
          timestamp
          message
        }
        members(limit: $limit) {
          uid
          name
          avatarUrl
        }
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "channelId": id,
      "memberLimit": 30,
    };
  }
}
