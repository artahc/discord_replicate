import 'package:discord_replicate/data/model/channel_data.dart';
import 'package:discord_replicate/data/model/message_data.dart';
import 'package:discord_replicate/data/repository/channel_repository.dart';
import 'package:discord_replicate/domain/bloc/channel/channel_event.dart';
import 'package:discord_replicate/domain/bloc/channel/channel_state.dart';
import 'package:discord_replicate/domain/network_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Consider deleting this or merge functionality with server bloc
class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final NetworkWrapper _networkApi;

  ChannelBloc(this._networkApi) : super(ChannelInfoInitial());

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    if (event is ChannelLoadInfo) {
      yield* _loadChannelInfo();
    }

    else if (event is ChannelLoadMessage) {
      yield* _loadChannelMessage();
    }
  }

  Stream<ChannelState> _loadChannelMessage() async* {
    try {
      emit(ChannelMessageLoadInProgress());
      List<MessageData> channelMessages = List.of(Iterable<MessageData>.generate(10, (i) => MessageData.createDummy()));
      await _networkApi
          .sendHttpRequest(RequestMethod.GET, "/servers/1/channels/1/channel_message")
          .then((value) => {emit(ChannelMessageLoadSuccess(channelMessages))});
    } catch (e) {
      emit(ChannelMessageLoadFailure());
      print(e.toString());
    }
  }

  Stream<ChannelState> _loadChannelInfo() async* {
    print("_loadChannelInfo");
    try {
      var channelData = ChannelData("Someone's Channel");
      emit(ChannelInfoLoadSuccess(channelData));
    } catch (e) {
      emit(ChannelLoadInfoFailure());
    }
  }
}
