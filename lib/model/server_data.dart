import 'package:discord_ui_practice/model/channel_data.dart';

class ServerData {
  final String id;
  final String name;
  final List<ChannelData> channels;

  ServerData(this.id, this.name, this.channels);

  static ServerData createDummy() {
    return ServerData("serverId", "name", [ChannelData("channelName")]);
  }
}
