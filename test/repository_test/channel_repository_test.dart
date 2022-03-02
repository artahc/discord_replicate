import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart';
import 'package:discord_replicate/data/repository/channel_repository_impl.dart';
import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart';
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart';

import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/credential/credential.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';

import 'package:discord_replicate/common/graphql/graphql_client_helper.dart';

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
      url: "http://localhost:4000/graphql",
      wsUrl: "ws://localhost:4000/graphql",
      bearerProvider: () async => "",
      defaultHeader: {
        "allow-me-in": "artahc123",
      },
    );
    var remoteApi = GraphQLChannelRemoteApiImpl(client: client);

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
