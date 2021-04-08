import 'package:discord_ui_practice/model/message_data.dart';

class ChannelData {
  final String channelName;
  final List<MessageData> messages;

  ChannelData(this.channelName, {this.messages = null});
}
