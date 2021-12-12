import 'package:flutter/material.dart';

@immutable
class Channel {
  final String channelName;
  final String serverName;

  Channel({required this.channelName, required this.serverName});
  factory Channel.dummy() => Channel(channelName: "Channel Data", serverName: "Server Name");
}
