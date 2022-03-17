import '../graphql_operation.dart';

class GetUserQuery extends GraphQLOperation {
  final String uid;

  GetUserQuery({required this.uid});

  @override
  String get operation => r"""
    query User($uid: String!) {
      user(uid: $uid) {
        uid
        avatarUrl
        name
        about
        privateChannels {
          id
          name
          userGroupRef
        }
        servers {
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
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      'uid': uid,
    };
  }
}
