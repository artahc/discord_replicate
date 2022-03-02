import '../../graphql_operation.dart';

class GetChannelQuery extends GraphQLOperation {
  final String id;
  final int memberLimit;

  GetChannelQuery({required this.id, required this.memberLimit});

  @override
  String get operation => r"""
    query Channel($id: String!) {
      channel(id: $id) {
        id
        name
        userGroupRef
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "id": id,
      "memberLimit": 30,
    };
  }
}
