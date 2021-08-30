import 'package:discord_ui_practice/data/model/message_data.dart';

abstract class ConversationEvent {}

class ConversationLoad extends ConversationEvent {}

abstract class ConversationState {}

class ConversationInitial extends ConversationState {}

class ConversationLoadSuccess extends ConversationState {
  final List<MessageData> messages;

  ConversationLoadSuccess(this.messages);
}
