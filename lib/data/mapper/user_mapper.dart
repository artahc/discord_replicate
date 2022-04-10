import 'dart:async';

import 'package:discord_replicate/data/mapper/channel_mapper.dart';
import 'package:discord_replicate/data/mapper/mapper.dart';
import 'package:discord_replicate/data/mapper/server_mapper.dart';
import 'package:discord_replicate/data/model/user_model.dart';
import 'package:discord_replicate/domain/model/user.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserMapper implements Mapper<UserModel, User> {
  final ChannelMapper _channelMapper;
  final ServerMapper _serverMapper;

  UserMapper(this._channelMapper, this._serverMapper);

  @override
  FutureOr<User> map(UserModel from) async {
    var servers = await Future.wait(from.servers.map((e) async => _serverMapper.map(e)));
    var privateChannels = await Future.wait(from.privateChannels.map((e) async => _channelMapper.map(e)));

    return User(
      uid: from.id,
      name: from.name,
      avatarUrl: from.avatarUrl,
      about: from.about,
      servers: servers,
      privateChannels: privateChannels,
    );
  }
}
