import 'package:discord_ui_practice/data/model/channel_data.dart';

class ChannelRepository {
  late ChannelData _currentChannelData;

  ChannelData getCurrentChannelData() => _currentChannelData;

  void setCurrentChannelData(ChannelData channelData){
    this._currentChannelData = channelData;
  }
}