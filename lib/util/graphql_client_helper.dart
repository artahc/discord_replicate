import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/model/credential.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientHelper {
  late GraphQLClient _client;
  late HttpLink _httpLink;
  late AuthLink _authLink;
  late Link _link;

  late Future<Credential?> Function() tokenProvider;

  GraphQLClientHelper({required String url, required this.tokenProvider, GraphQLCache? cache}) {
    _httpLink = HttpLink(url);
    _authLink = AuthLink(getToken: () async {
      var credential = await tokenProvider.call();
      var token = credential == null ? "" : credential.token;
      var bearer = 'Bearer $token';
      log(bearer, name: this.runtimeType.toString());

      return bearer;
    });

    _link = _authLink.concat(_httpLink);
    _client = GraphQLClient(link: _link, cache: cache ?? GraphQLCache());
  }

  Future<Map<String, dynamic>> query(String query, {Map<String, dynamic> variables = const {}}) async {
    log("Request => ${query.trim()}", name: this.runtimeType.toString());
    var options = QueryOptions(document: gql(query), variables: variables);
    var result = await _client.query(options);
    if (result.hasException) {
      return Future.error(result.exception!);
    } else {
      return result.data!;
    }
  }
}
