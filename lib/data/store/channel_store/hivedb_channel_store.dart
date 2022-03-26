import 'dart:async';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/application/extensions/extensions.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/observable_entity_event.dart';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Named("DB_CHANNEL")
@Injectable(as: Store<Channel>, env: [Env.PROD, Env.DEV])
class HiveChannelStore implements Store<Channel> {
  HiveChannelStore();

  FutureOr<Box<Channel>> getBox() async {
    if (!Hive.isBoxOpen(HiveConstants.CHANNEL_BOX))
      return Hive.openBox(HiveConstants.CHANNEL_BOX);
    else
      return Hive.box(HiveConstants.CHANNEL_BOX);
  }

  @override
  Future<bool> exist(String id) async {
    var box = await getBox();
    return box.containsKey(id);
  }

  @override
  Future<Channel?> load(String id) async {
    var box = await getBox();
    return box.get(id);
  }

  @override
  Future<List<Channel>> loadAll() async {
    var box = await getBox();
    return box.values.toList();
  }

  @override
  FutureOr onDispose() async {
    var box = await getBox();
    return box.deleteFromDisk().whenComplete(() {
      log.w("Channel database cleared.");
    });
  }

  @override
  Future<void> save(Channel channel) async {
    var box = await getBox();
    await box.put(channel.id, channel);
  }

  @override
  Future<void> saveAll(List<Channel> items) async {
    var box = await getBox();
    var entries = items.toMap<String, Channel>(keyConverter: (e) => e.id, valueConverter: (e) => e);
    await box.putAll(entries);
  }

  @override
  Future<void> delete(String id) async {
    var box = await getBox();
    await box.delete(id);
  }

  @override
  Future<void> deleteAll(List<String> ids) async {
    var box = await getBox();
    await box.deleteAll(ids);
  }

  @override
  Stream<ObservableEntityEvent<Channel>> observe({String? id}) {
    // TODO: implement observe
    throw UnimplementedError();
  }
}
