import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/credential/credential.dart';
import 'package:discord_replicate/repository/channel_repository/hivedb_channel_store.dart';
import 'package:discord_replicate/repository/channel_repository/inmemory_channel_store.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/repository/auth_repository/auth_service.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthRepository {}

class MockDb extends Mock implements HiveChannelStore {}

class MockChannelCache extends Mock implements InMemoryChannelStore {}

class MockChannel extends Mock implements Channel {}

void main() {
  group("Remote Source", () {
    var mockDb = MockDb();
    var mockCache = MockChannelCache();
    var mockAuthService = MockAuthService();

    var client = GraphQLClientHelper(
      "http://localhost:4000/graphql",
      "ws://localhost:4000/graphql",
      authService: mockAuthService,
      defaultHeader: {
        "allow-me-in": "artahc123",
      },
    );
    var remoteApi = GraphQLApiImpl(client: client);

    var channelRepo = ChannelRepositoryImpl(api: remoteApi, database: mockDb, cache: mockCache);

    setUpAll(() {
      when(() => mockAuthService.getCredential(forceRefresh: any(named: "forceRefresh")))
          .thenAnswer((invocation) => Future.value(Credential(email: "", token: "", uid: "")));
      registerFallbackValue(MockChannel());
    });

    test("Load channel from remote source, should be able to parse to Channel model.", () async {
      var channelId = "PkM6m7lhnvIORIRuoVJv";

      when(() => mockDb.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.save(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.load(any())).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.save(any())).thenAnswer((invocation) => Future.value(null));

      var user = await channelRepo.getChannel(channelId);

      verify(() => mockDb.load(any())).called(1);
      verify(() => mockDb.save(any())).called(1);
      verify(() => mockCache.load(any())).called(1);
      verify(() => mockCache.save(any())).called(1);

      expect(user, isA<Channel>());
    });
  });
}
