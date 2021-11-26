import 'dart:async';

import 'package:discord_replicate/bloc/direct_message/direct_message_event.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// merge functionality
class DirectMessageBloc extends Bloc<DirectMessageEvent, DirectMessageState> {

  final StreamController<String> _directMessageController = StreamController<String>();
  Sink<String> get activeDirectMessage => _directMessageController.sink;

  DirectMessageBloc() : super(DirectMessageInitial());

  @override
  Stream<DirectMessageState> mapEventToState(DirectMessageEvent event) async* {
    print(event.toString());
    debugPrintStack();
  }

  @override
  Future<void> close() {
    _directMessageController.close();
    return super.close();
  }
}
