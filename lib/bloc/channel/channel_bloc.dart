import 'package:discord_ui_practice/bloc/channel/channel_event.dart';
import 'package:discord_ui_practice/bloc/channel/channel_state.dart';
import 'package:discord_ui_practice/method_channel/networking_channel.dart';
import 'package:discord_ui_practice/model/channel_data.dart';
import 'package:discord_ui_practice/model/message_data.dart';
import 'package:discord_ui_practice/repository/channel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Consider deleting this or merge functionality with server bloc
class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final NetworkingMethodChannel _networkApi;
  final ChannelRepository _repository;

  ChannelBloc(this._repository, this._networkApi) : super(ChannelInfoInitial());

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    // region -- Channel Info
    if (event is ChannelLoadInfo) {
      yield* _loadChannelInfo();
    }
    // endregion

    // region -- Channel Message
    else if (event is ChannelLoadMessage) {
      yield* _loadChannelMessage();
    }
    // endregion
  }

  Stream<ChannelState> _loadChannelMessage() async* {
    print("_loadChannelMessage");
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
      _repository.setCurrentChannelData(channelData);
      emit(ChannelInfoLoadSuccess(channelData));
    } catch (e) {
      emit(ChannelLoadInfoFailure());
    }
  }
}
