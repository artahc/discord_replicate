import '../graphql_operation.dart';

class GetServerQuery extends GraphQLOperation {
  final String id;

  GetServerQuery({required this.id});

  @override
  String get operation => r"""
    query Server($id: String!) {
      server(id: $id) {
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
      "id": id,
    };
  }
}
