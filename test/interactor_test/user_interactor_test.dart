import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/interactor/channel/channel_interactor_impl.dart';
import 'package:discord_replicate/interactor/user/user_interactor.dart';
import 'package:discord_replicate/interactor/user/user_interactor_impl.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/credential/credential.dart';
import 'package:discord_replicate/repository/channel_repository/hivedb_channel_store.dart';
import 'package:discord_replicate/repository/channel_repository/inmemory_channel_store.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/repository/auth_repository/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDb extends Mock implements HiveChannelStore {}

class MockCache extends Mock implements InMemoryChannelStore {}

class MockAuthService extends Mock implements AuthRepository {}

class MockUserGroupRepository extends Mock implements UserGroupRepository {}

class MockChannel extends Mock implements Channel {}

void main() {
  var mockCache = MockCache();
  var mockDb = MockDb();
  var mockAuthService = MockAuthService();
  var mockUserGroupRepo = MockUserGroupRepository();
  var client = GraphQLClientHelper(
    "http://localhost:4000/graphql",
    "ws://localhost:4000/graphql",
    authService: mockAuthService,
    defaultHeader: {
      "allow-me-in": "artahc123",
    },
  );

  var api = GraphQLApiImpl(client: client);

  var userInteractor = UserInteractorImpl();

  setUpAll(() {
    when(() => mockAuthService.getCredential(forceRefresh: any(named: "forceRefresh")))
        .thenAnswer((invocation) => Future.value(Credential(email: "", token: "", uid: "")));
    registerFallbackValue(MockChannel());
  });

  
}
