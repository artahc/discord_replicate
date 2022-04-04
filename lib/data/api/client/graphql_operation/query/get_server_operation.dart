import '../graphql_operation.dart';

class GetServerQuery extends GraphQLOperation {
  final String id;

  GetServerQuery({required this.id})
      : super(
          operation: r"""
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
          """,
          variables: {
            "id": id,
          },
        );
}
