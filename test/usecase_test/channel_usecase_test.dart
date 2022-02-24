import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/credential/credential.dart';
import 'package:discord_replicate/repository/channel_repository/hivedb_channel_store.dart';
import 'package:discord_replicate/repository/channel_repository/inmemory_channel_store.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/service/channel_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDb extends Mock implements HiveChannelStore {}

class MockCache extends Mock implements InMemoryChannelStore {}

class MockAuthService extends Mock implements AuthService {}

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
  var api = RemoteApiImpl(client: client);
  var channelRepo = ChannelRepositoryImpl(api: api, cache: mockCache, database: mockDb);
  var channelService = ChannelServiceImpl(channelRepo: channelRepo, userGroupRepo: mockUserGroupRepo);

  setUpAll(() {
    when(() => mockAuthService.getCredential(forceRefresh: any(named: "forceRefresh")))
        .thenAnswer((invocation) => Future.value(Credential(email: "", token: "", uid: "")));
    registerFallbackValue(MockChannel());
  });

  test(
    "Fetch channel messages from remote, should be able to parse result into PaginationResponse<RawMessage>",
    () async {
      when(() => mockDb.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.save(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.save(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockUserGroupRepo.getUserGroup(any())).thenAnswer((invocation) => Future.value());
      
      var rawMessages = await channelService.getMessages("PkM6m7lhnvIORIRuoVJv", 15, null);

      print(rawMessages);
    },
  );
}
