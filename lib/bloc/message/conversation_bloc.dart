import 'package:discord_ui_practice/bloc/message/conversation_event.dart';
import 'package:discord_ui_practice/method_channel/networking_channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final NetworkingMethodChannel _networkApi;

  ConversationBloc(this._networkApi) : super(ConversationInitial());

  @override
  Stream<ConversationState> mapEventToState(ConversationEvent event) async* {}
}
