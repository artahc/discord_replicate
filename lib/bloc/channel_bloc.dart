import 'package:discord_ui_practice/bloc/channel_event.dart';
import 'package:discord_ui_practice/bloc/channel_state.dart';
import 'package:discord_ui_practice/model/message_data.dart';
import 'package:discord_ui_practice/networking_channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/message_data.dart';
import '../model/message_data.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final NetworkingMethodChannel networkApi;

  ChannelBloc(this.networkApi) : super(ChannelLoadMessageInProgress());

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    if (event is ChannelLoadMessage) {
      yield* _loadChannelMessage();
    } else if (event is ChannelLoadMessageInProgress) {
      print("Load in progress");
    }
  }

  Stream<ChannelState> _loadChannelMessage() async* {
    try {
      List<MessageData> channelMessages = List.of(Iterable<MessageData>.generate(10, (i)=>MessageData.createDummy()));
      await networkApi
          .sendHttpRequest(RequestMethod.GET, "/servers/1/channels/1/channel_message")
          .then((value) => {emit(ChannelLoadMessageSuccess(channelMessages))});
    } catch (e) {
      emit(ChannelLoadMessageFailed());
      print(e.toString());
    }
  }
}
