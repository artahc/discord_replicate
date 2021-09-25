import 'package:discord_replicate/domain/bloc/message/conversation_event.dart';
import 'package:discord_replicate/domain/network_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final NetworkWrapper _networkApi;

  ConversationBloc(this._networkApi) : super(ConversationInitial());

  @override
  Stream<ConversationState> mapEventToState(ConversationEvent event) async* {}
}
