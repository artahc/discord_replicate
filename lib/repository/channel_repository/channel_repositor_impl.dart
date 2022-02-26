import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/api/paginated_response.dart';
import 'package:discord_replicate/repository/channel_repository/hivedb_channel_store.dart';
import 'package:discord_replicate/repository/channel_repository/inmemory_channel_store.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  late Logger log = Logger();

  final RemoteApi _api;
  final Store<Channel> _db;
  final Store<Channel> _cache;

  ChannelRepositoryImpl({
    RemoteApi? api,
    Store<Channel>? database,
    Store<Channel>? cache,
  })  : _api = api ?? sl.get<RemoteApi>(),
        _db = database ?? sl.get<HiveChannelStore>(),
        _cache = cache ?? sl.get<InMemoryChannelStore>();

  @override
  Future<Channel> getChannel(String id) async {
    var memory = LazyStream(() {
      return _cache.load(id).asStream().where((channel) => channel != null).doOnData((channel) {
        log.i("Channel found on memory cache. $channel");
      });
    });

    var local = LazyStream(() {
      return _db.load(id).asStream().where((event) => event != null).doOnData((channel) async {
        await _cache.save(channel!);
        log.i("Channel found on local database. $channel");
      });
    });

    var remote = LazyStream(() {
      return _api.getChannel(id).asStream().doOnData((channel) async {
        await _cache.save(channel);
        await _db.save(channel);
        log.i("Channel retrieved from remote API. $channel");
      });
    });

    var result = await ConcatStream([memory, local, remote]).firstWhere((element) => element != null);
    return result!;
  }

  @override
  Future<RawMessage> createMessage(String channelId, String message, int timestamp) {
    return _api.createMessage(channelId, message, timestamp);
  }

  @override
  Stream<RawMessage> subscribeChannelMessages(String channelId) async* {
    yield* _api.subscribeChannelMessage(channelId);
  }

  @override
  Future<PaginationResponse<RawMessage>> getChannelMessages(String channelId, int limit, String? lastMessageId) {
    return _api.getChannelMessages(channelId, limit, lastMessageId);
  }

  @override
  Future<void> saveChannels(List<Channel> items) async {
    await _db.saveAll(items);
    await _cache.saveAll(items);
  }

  @override
  Future<List<Channel>> getChannels() {
    return _db.loadAll();
  }

  @override
  Future<void> saveChannel(Channel channel) async {
    await _db.save(channel);
    await _cache.save(channel);
  }
}
