import 'dart:async';

import 'package:async/async.dart';
import 'package:custom_extension/custom_extensions.dart';
import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: ChannelRepository, env: [Env.PROD, Env.DEV])
class ChannelRepositoryImpl implements ChannelRepository {
  final ChannelRemoteApi _api;
  final Store<String, Channel> _db;
  final Store<String, Channel> _cache;

  ChannelRepositoryImpl(
    this._api,
    @Named("DB_CHANNEL") this._db,
    @Named("CACHE_CHANNEL") this._cache,
  );

  @override
  Future<Channel> getChannelById(String id) async {
    var memory = LazyStream(() {
      return Future.sync(() => _cache.load(id))
          .asStream()
          .where((channel) => channel != null)
          .cast<Channel?>()
          .doOnData((channel) {
        log.i("Channel found on memory cache. $channel");
      });
    });

    var local = LazyStream(() {
      return Future.sync(() => _db.load(id))
          .asStream()
          .where((event) => event != null)
          .cast<Channel?>()
          .doOnData((channel) async {
        await saveChannel(channel!);
        log.i("Channel found on local database. $channel");
      });
    });

    var remote = LazyStream(() {
      return _api.getChannelById(id).asStream().doOnData((channel) async {
        await saveChannel(channel);
        log.i("Channel retrieved from remote API. $channel");
      });
    });

    var result = await ConcatStream([memory, local, remote]).firstWhere((element) => element != null);
    return result!;
  }

  @override
  Future<Message> createMessage(String channelId, String message, int timestamp) {
    return _api.createMessage(channelId, message, timestamp);
  }

  @override
  Stream<Message> subscribeChannelMessages(String channelId) async* {
    yield* _api.subscribeChannelMessage(channelId).doOnData((newMessage) async {
      if (await _cache.exist(channelId)) {
        var channel = await _cache.load(channelId);
        var updated = channel!.copyWith(messages: [...channel.messages, newMessage]);
        await saveChannel(updated);
      } else if (await _db.exist(channelId)) {
        var channel = await _db.load(channelId);
        var updated = channel!.copyWith(messages: [...channel.messages, newMessage]);
        await saveChannel(updated);
      }
    });
  }

  @override
  Future<PaginationResponse<Message>> getChannelMessages(String channelId, int limit, String? lastMessageId) {
    return _api.getChannelMessages(channelId, limit, lastMessageId);
  }

  @override
  Future<void> saveAllChannels(Iterable<Channel> items) async {
    await _db.saveAll(items.toMap(keyConverter: (e) => e.id, valueConverter: (e) => e));
    await _cache.saveAll(items.toMap(keyConverter: (e) => e.id, valueConverter: (e) => e.id));
  }

  @override
  Future<Iterable<Channel>> getAllChannels() async {
    var channels = await _db.loadAll();
    return channels;
  }

  @override
  Future<void> saveChannel(Channel channel) async {
    await _db.save(channel.id, channel);
    await _cache.save(channel.id, channel);
  }

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }

  @override
  Future<void> deleteAllChannel(Iterable<String> channelIds) async {
    await _cache.deleteAll(channelIds);
    await _db.deleteAll(channelIds);
  }

  @override
  Future<void> deleteChannel(String channelId) async {
    await _cache.delete(channelId);
    await _db.delete(channelId);
  }
}
