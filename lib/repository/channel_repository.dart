import 'package:discord_ui_practice/model/channel_data.dart';

class ChannelRepository {
  ChannelData _currentChannelData;

  ChannelData getCurrentChannelData() => _currentChannelData;

  void setCurrentChannelData(ChannelData channelData){
    this._currentChannelData = channelData;
  }
}