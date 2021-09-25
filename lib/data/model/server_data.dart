import 'dart:math';

import 'package:discord_replicate/data/model/channel_data.dart';
import 'package:flutter/material.dart';

@immutable
class ServerData {
  final String id;
  final String name;
  final List<ChannelData> channels;

  ServerData(this.id, this.name, this.channels);

  static ServerData createDummy(int id) {
    return ServerData("serverId_$id", "name", [ChannelData("channelName")]);
  }
}




