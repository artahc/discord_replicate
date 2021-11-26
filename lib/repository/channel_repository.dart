import 'package:discord_replicate/model/channel_data.dart';

class ChannelRepository {
  late ChannelData _currentChannelData;

  ChannelData getCurrentChannelData() => _currentChannelData;

  void setCurrentChannelData(ChannelData channelData){
    this._currentChannelData = channelData;
  }
}