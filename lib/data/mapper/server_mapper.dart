import 'dart:async';

import 'package:discord_replicate/data/mapper/channel_mapper.dart';
import 'package:discord_replicate/data/mapper/mapper.dart';
import 'package:discord_replicate/data/model/server_model.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ServerMapper implements Mapper<ServerModel, Server> {
  final ChannelMapper _channelMapper;

  ServerMapper(this._channelMapper);

  @override
  FutureOr<Server> map(ServerModel from) async {
    return Future.wait(from.channels.map((e) async => _channelMapper.map(e))).then((channels) {
      return Server(
        id: from.id,
        imageUrl: from.imageUrl,
        name: from.name,
        userGroupRef: from.userGroupRef,
        channels: channels,
      );
    });
  }
}
