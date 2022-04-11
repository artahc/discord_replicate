import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/repository/channel_repository_impl.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final container = GetIt.asNewInstance();

  // Dependency
  late ChannelRemoteApi api;
  late Store<String, Channel> mockDb;
  late Store<String, Channel> mockCache;

  // Object under test.
  late ChannelRepository channelRepo;

  setUpAll(() async {
    configureDependencies(container, Env.TEST);

    api = container.get();
    mockDb = container.get(instanceName: "DB_CHANNEL");
    mockCache = container.get(instanceName: "CACHE_CHANNEL");

    channelRepo = ChannelRepositoryImpl(api, mockDb, mockCache);
  });

  test(
    """
    Given ChannelRepository,
    When getChannel called,
    Then repository must perform db, and cache check before requesting to remote API, and should return instance of Channel.
    """,
    () async {
      var channelId = "PkM6m7lhnvIORIRuoVJv";
      var limit = 30;
      var expectedResult = const Channel(
        id: "PkM6m7lhnvIORIRuoVJv",
        name: "channel-name",
        userGroupRef: "user-group-ref",
        members: [],
        messages: [],
      );

      when(() => api.getChannelById(channelId, memberLimit: limit))
          .thenAnswer((invocation) => Future.value(expectedResult));
      when(() => mockDb.load(channelId)).thenAnswer((invocation) => Future.value(null));
      when(() => mockDb.save(expectedResult.id, expectedResult)).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.load(channelId)).thenAnswer((invocation) => Future.value(null));
      when(() => mockCache.save(expectedResult.id, expectedResult)).thenAnswer((invocation) => Future.value(null));

      var channel = await channelRepo.getChannel(channelId);

      verify(() => mockDb.load(channelId)).called(1);
      verify(() => mockDb.save(expectedResult.id, expectedResult)).called(1);
      verify(() => mockCache.load(channelId)).called(1);
      verify(() => mockCache.save(expectedResult.id, expectedResult)).called(1);

      expect(channel, isA<Channel>());
    },
  );
}
