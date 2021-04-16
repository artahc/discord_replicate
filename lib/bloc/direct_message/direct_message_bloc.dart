import 'package:discord_ui_practice/bloc/direct_message/direct_message_event.dart';
import 'package:discord_ui_practice/method_channel/networking_channel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// merge functionality
class DirectMessageBloc extends Bloc<DirectMessageEvent, DirectMessageState> {
  final NetworkingMethodChannel _networkApi;

  DirectMessageBloc(this._networkApi) : super(DirectMessageInitial());

  @override
  Stream<DirectMessageState> mapEventToState(DirectMessageEvent event) async* {
    print(event.toString());
    debugPrintStack();
  }
}
