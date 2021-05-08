import 'dart:math';

import 'package:discord_ui_practice/model/channel_data.dart';

abstract class ServerData {}

class SingleServerData extends ServerData{
  final String id;
  final String name;
  final List<ChannelData> channels;

  SingleServerData(this.id, this.name, this.channels);

  static SingleServerData createDummy() {
    return SingleServerData("serverId+${Random().nextInt(999)}", "name", [ChannelData("channelName")]);
  }

  @override
  String toString() {
    return {"id": id, "name": name, "channels": channels.toString()}.toString();
  }

}
class GroupServerData extends ServerData {
  List<SingleServerData> serverData;

  GroupServerData(this.serverData);
}



