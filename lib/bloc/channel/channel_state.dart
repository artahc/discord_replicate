import 'package:discord_ui_practice/model/channel_data.dart';
import 'package:discord_ui_practice/model/message_data.dart';

abstract class ChannelState {}

//region -- Channel Message
class ChannelMessageLoadSuccess extends ChannelState {
  final List<MessageData> messages;

  ChannelMessageLoadSuccess(this.messages);
}

class ChannelMessageLoadInProgress extends ChannelState {}
class ChannelMessageInitial extends ChannelState {}

class ChannelMessageLoadFailure extends ChannelState {}
//endregion

//region -- Channel Info
class ChannelInfoLoadInProgress extends ChannelState {}

class ChannelInfoLoadSuccess extends ChannelState {
  final ChannelData data;

  ChannelInfoLoadSuccess(this.data);
}

class ChannelInfoLoadFailure extends ChannelState {}
//endregion
