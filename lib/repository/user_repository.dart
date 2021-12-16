import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';

class UserRepository {
  GraphQLClientHelper _client;

  UserRepository({required GraphQLClientHelper graphqlClient}) : _client = graphqlClient;

  Future<User> loadUser(String uid) async {
    String query = """
      query User(\$uid: String!) {
        user(uid: \$uid) {
          id
          username
          serverRefs  
        }
      }
    """;

    var varibales = {
      'uid': uid,
    };

    var raw = await _client.query(query, variables: varibales);
    return User.fromJson(raw['user']);
  }
}
