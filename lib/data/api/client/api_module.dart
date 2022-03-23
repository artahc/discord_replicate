import 'package:discord_replicate/domain/repository/auth_repository.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @Named("BASE_URL")
  String get baseUrl => "http://localhost:4000/graphql";

  @Named("WS_URL")
  String get wsUrl => "ws://localhost:4000/graphql";

  @Injectable()
  @Named("API_LINK")
  Link link(@Named("BASE_URL") String url, @Named("WS_URL") String wsUrl, AuthRepository authRepo) {
    print("API_LINK: $url");
    var httpLink = HttpLink(url);
    var authLink = AuthLink(getToken: () async {
      var token = await authRepo.getCredential(forceRefresh: true).then((credential) => credential == null ? "" : credential.token);
      return 'Bearer $token';
    });

    var wsLink = WebSocketLink(wsUrl);
    var link = authLink.concat(httpLink);

    link = Link.split((request) => request.isSubscription, wsLink, link);
    return link;
  }

  @LazySingleton()
  GraphQLClient client(@Named("API_LINK") Link link) => GraphQLClient(link: link, cache: GraphQLCache());
}
