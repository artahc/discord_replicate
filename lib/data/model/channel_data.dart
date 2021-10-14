import 'package:flutter/material.dart';

@immutable
class ChannelData {
  final String channelName;
  final String serverName;

  ChannelData({required this.channelName, required this.serverName});
  factory ChannelData.createDummy() => ChannelData(channelName: "Channel Data", serverName: "Server Name");
}
