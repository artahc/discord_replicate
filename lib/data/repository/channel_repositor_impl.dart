import 'dart:async';

import 'package:async/async.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/message/message.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/common/app_config.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  late Logger log = Logger();

  final ChannelRemoteApi _api;
  final Store<Channel> _db;
  final Store<Channel> _cache;

  ChannelRepositoryImpl({
    ChannelRemoteApi? api,
    Store<Channel>? database,
    Store<Channel>? cache,
  })  : _api = api ?? sl.get(),
        _db = database ?? sl.get(),
        _cache = cache ?? sl.get();

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
      return _api.getChannelById(id).asStream().doOnData((channel) async {
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

  @override
  FutureOr onDispose() async {
    await _cache.onDispose();
    await _db.onDispose();
  }
}
