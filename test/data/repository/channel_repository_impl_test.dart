import 'package:custom_extension/custom_extensions.dart';
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

  setUpAll(() async {
    await initHive();
    configureDependencies(container, Env.TEST);
  });

  group("getChannelById", () {
    setUpAll(() async {
      api = container.get();
      db = HiveChannelStore();
      cache = InMemoryChannelStore();

      repo = ChannelRepositoryImpl(api, db, cache);
    });

    setUp(() async {
      reset(api);
      await db.clear();
      await cache.clear();
    });

    test("""
    Given mocked dependency.
    When getChannelById called,
    Then verify interaction in order -> load from memory -> db -> finally api --> also verify cache and db save get called.
    """, () async {
      // arrange
      ChannelRemoteApi mockApi = container.get();
      Store<String, Channel> mockDb = container.get(instanceName: "DB_CHANNEL");
      Store<String, Channel> mockCache = container.get(instanceName: "CACHE_CHANNEL");

      var mockedRepo = ChannelRepositoryImpl(mockApi, mockDb, mockCache);

      var channel = const Channel(id: "foo", name: "name", userGroupRef: "userGroupRef");

      when(() => mockCache.load("foo")).thenAnswer((invocation) async => null);
      when(() => mockDb.load("foo")).thenAnswer((invocation) async => null);
      when(() => mockApi.getChannelById("foo")).thenAnswer((invocation) async => channel);

      // execute
      await mockedRepo.getChannelById("foo");

      verifyInOrder([
        () => mockCache.load("foo"),
        () => mockDb.load("foo"),
        () => mockApi.getChannelById("foo"),
      ]);
      verify(() => mockCache.save(channel.id, channel)).called(1);
      verify(() => mockDb.save(channel.id, channel)).called(1);
    });

    test(
      """
    Given DB and cache is empty,
    When getChannelById called,
    Then verify remote API called and returns instance of Channel.
    """,
      () async {
        // arrange
        const channelId = "PkM6m7lhnvIORIRuoVJv";
        const expected = Channel(
          id: channelId,
          name: "channel-name",
          userGroupRef: "user-group-ref",
          members: [],
          messages: [],
        );

        when(() => api.getChannelById(channelId)).thenAnswer((invocation) async => expected);

        // execute
        var loaded = await repo.getChannelById(channelId);

        // assert
        expect(
          loaded,
          allOf([
            isA<Channel>(),
            equals(expected),
          ]),
        );
        verify(() => api.getChannelById(channelId)).called(1);
      },
    );

    test("""
    Given DB contains requested data.
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
      var loaded = await repo.getChannelById(channelId);

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

  group("getAllChannels", () {
    setUpAll(() async {
      api = container.get();
      db = HiveChannelStore();
      cache = InMemoryChannelStore();

      repo = ChannelRepositoryImpl(api, db, cache);
    });

    setUp(() async {
      reset(api);
      await db.clear();
      await cache.clear();
    });

    test("""
    Given a channel repo impl with empty DB and cache.
    When getAllChannels called,
    Then verifyNoInteraction to remote API. 
    """, () async {});

    test("""
    Given a channel repo impl with empty DB and cache.
    When getAllChannels called,
    Then verifyNoInteraction to remote API. 
    """, () async {
      // arrange
      expect(await db.isEmpty(), true);
      expect(await cache.isEmpty(), true);

      // execute
      await repo.getAllChannels();

      // assert
      verifyZeroInteractions(api);
    });

    test("""
    Given a channel repo impl with existing item in DB and cache.
    When getAllChannels called,
    Then should return fresh item from DB. 
    """, () async {
      // arrange
      expect(await db.isEmpty(), true);
      expect(await cache.isEmpty(), true);

      var foo = const Channel(id: "foo", name: "name", userGroupRef: "userGroupRef");
      var bar = const Channel(id: "bar", name: "name", userGroupRef: "userGroupRef");

      await db.saveAll([foo, bar].toMap(keyConverter: (e) => e.id, valueConverter: (e) => e));

      expect(await db.loadAll(), containsAll([foo, bar]));

      // execute
      var channels = await repo.getAllChannels();

      // assert
      expect(channels, containsAll([foo, bar]));
      verifyZeroInteractions(api);
    });
  });

  group("saveChannel", () {
    setUpAll(() async {
      api = container.get();
      db = container.get(instanceName: "DB_CHANNEL");
      cache = container.get(instanceName: "CACHE_CHANNEL");

      repo = ChannelRepositoryImpl(api, db, cache);
    });

    setUp(() {
      reset(api);
      reset(db);
      reset(cache);
    });

    test("""
    """, () async {
      // arrange

      // execute

      // assert
    });
  });

  group("getChannelMessages", () {});
}
