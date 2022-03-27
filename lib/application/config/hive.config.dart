import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/domain/model/user_group.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive
    ..registerAdapter(UserAdapter(), override: true)
    ..registerAdapter(ServerAdapter(), override: true)
    ..registerAdapter(ChannelAdapter(), override: true)
    ..registerAdapter(MessageAdapter(), override: true)
    ..registerAdapter(MemberAdapter(), override: true)
    ..registerAdapter(UserGroupAdapter(), override: true);
}
