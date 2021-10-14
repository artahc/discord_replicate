import 'package:discord_replicate/domain/bloc/message/conversation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {

  ConversationBloc() : super(ConversationInitial());

  @override
  Stream<ConversationState> mapEventToState(ConversationEvent event) async* {}
}
