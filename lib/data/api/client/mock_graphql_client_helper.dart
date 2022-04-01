import 'package:discord_replicate/application/config/injection.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';

@Singleton(as: GraphQLClient, env: [Env.TEST])
class MockGraphQLClient extends Mock implements GraphQLClient {}
