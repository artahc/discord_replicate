import 'package:discord_ui_practice/networking_channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

abstract class ChannelState {}

class ChannelLoadSuccess extends ChannelState {}

class ChannelLoadInProgress extends ChannelState {}

class ChannelLoadFailed extends ChannelState {}

abstract class ChannelEvent {}

class ChannelLoadMessage extends ChannelEvent {}

class ChannelLoadMessageSuccess extends ChannelEvent {}

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final NetworkingMethodChannel networkApi;
  ChannelBloc(this.networkApi) : super(ChannelLoadInProgress());

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    if (event is ChannelLoadMessage) {
      yield* _loadChannelMessage();
    } else if (event is ChannelLoadMessageSuccess) {
      print("Load in progress");
    }
  }

  Stream<ChannelState> _loadChannelMessage() async* {
    try {
      networkApi.sendHttpRequest(RequestMethod.GET, "/servers/1/channels/1/channel_message");
      print("Get Messages");
    } catch (e) {
      print(e);
    }
  }


}
