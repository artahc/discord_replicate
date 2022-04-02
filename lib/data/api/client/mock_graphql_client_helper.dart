import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@LazySingleton(as: GraphQLClientHelper, env: [Env.TEST])
class MockGraphQLClientHelper extends Mock implements GraphQLClientHelper {}
