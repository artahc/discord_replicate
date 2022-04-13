import 'package:discord_replicate/application/config/hive.config.dart';
import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/repository/channel_repository_impl.dart';
import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart';
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart';
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
  late Store<String, Channel> db;
  late Store<String, Channel> cache;

  // Object under test.
  late ChannelRepository repo;

  group("getChannel from Remote API", () {
    setUpAll(() async {
      await initHive();
      configureDependencies(container, Env.TEST);

      api = container.get();
      db = HiveChannelStore();
      cache = InMemoryChannelStore();

      repo = ChannelRepositoryImpl(api, db, cache);
    });

    setUp(() async {
      await db.clear();
      await cache.clear();
    });

    test(
      """
    Given channel repository impl. DB and cache is empty,
    When getChannel called,
    Then should return instance of Channel.
    """,
      () async {
        // arrange
        const channelId = "PkM6m7lhnvIORIRuoVJv";
        const limit = 30;
        const expected = Channel(
          id: channelId,
          name: "channel-name",
          userGroupRef: "user-group-ref",
          members: [],
          messages: [],
        );

        when(() => api.getChannelById(channelId, memberLimit: limit)).thenAnswer((invocation) async => expected);

        // execute
        var loaded = await repo.getChannel(channelId);

        // assert
        expect(
          loaded,
          allOf([
            isA<Channel>(),
            equals(expected),
          ]),
        );
        verify(() => api.getChannelById(channelId, memberLimit: limit)).called(1);
      },
    );

    test("""
    Given channel repository impl. DB contains requested data.
    When getChannel called, 
    Then verify remote API not called. Return item from db. 
    """, () async {
      // arrange
      assert(await db.isEmpty());
      assert(cache.isEmpty() == true);

      const channelId = "ch";
      const expected = Channel(id: channelId, name: "name", userGroupRef: "userGroupRef");

      when(() => api.getChannelById(channelId)).thenAnswer((invocation) async => expected);
      await db.save(expected.id, expected);

      // execute
      var loaded = await repo.getChannel(channelId);

      // assert
      verifyNever(() => api.getChannelById(channelId));
      verifyNoMoreInteractions(api);
      expect(
        loaded,
        allOf([
          isA<Channel>(),
          equals(expected),
        ]),
      );
    });
  });
}
