import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: GraphQLClient, env: [Env.TEST])
class MockGraphQLClient extends Mock implements GraphQLClient {}

@module
abstract class GraphQLClientModule {
  @Named("BASE_URL")
  String get baseUrl => "https://discord-replicate-backend-1029.herokuapp.com/graphql";

  @Named("WS_URL")
  String get wsUrl => "ws://discord-replicate-backend-1029.herokuapp.com/graphql";

  @Injectable()
  @Named("API_LINK")
  Link link(@Named("BASE_URL") String url, @Named("WS_URL") String wsUrl, AuthRepository authRepo) {
    var httpLink = HttpLink(url);
    var authLink = AuthLink(getToken: () async {
      var token = await authRepo
          .getCredential(forceRefresh: true)
          .then((credential) => credential == null ? "" : credential.token);
      return 'Bearer $token';
    });

    var wsLink = WebSocketLink(wsUrl);
    var link = authLink.concat(httpLink);

    link = Link.split((request) => request.isSubscription, wsLink, link);
    return link;
  }

  @LazySingleton(env: [Env.DEV, Env.PROD])
  GraphQLClient client(@Named("API_LINK") Link link) => GraphQLClient(link: link, cache: GraphQLCache());
}
