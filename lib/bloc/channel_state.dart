import 'package:discord_ui_practice/model/message_data.dart';

abstract class ChannelState {}

class ChannelLoadMessageSuccess extends ChannelState {
  final List<MessageData> messages;

  ChannelLoadMessageSuccess(this.messages);
}

class ChannelLoadMessageInProgress extends ChannelState {}

class ChannelLoadMessageFailed extends ChannelState {}