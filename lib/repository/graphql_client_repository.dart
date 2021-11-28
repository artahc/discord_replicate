import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientRepository {
  late GraphQLClient _client;
  late HttpLink _link;

  GraphQLClientRepository({required String url, GraphQLCache? cache}) {
    _link = HttpLink(url);
    _client = GraphQLClient(link: _link, cache: cache ?? GraphQLCache());
  }

  Future<Map<String, dynamic>> query(String query) async {
    var options = QueryOptions(document: gql(query));
    var result = await _client.query(options);

    if (result.hasException) {
      throw result.exception!.linkException!.originalException;
    } else {
      return result.data!;
    }
  }
}
