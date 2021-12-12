import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message_data.dart';
import 'package:discord_replicate/bloc/channel/channel_event.dart';
import 'package:discord_replicate/bloc/channel/channel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Consider deleting this or merge functionality with server bloc
class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {

  ChannelBloc() : super(ChannelInfoInitial());

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    if (event is ChannelLoadInfo) {
      yield* _loadChannelInfo();
    } else if (event is ChannelLoadMessage) {
      yield* _loadChannelMessage();
    }
  }

  Stream<ChannelState> _loadChannelMessage() async* {
    try {
      emit(ChannelMessageLoadInProgress());
      List<MessageData> channelMessages = List.of(Iterable<MessageData>.generate(10, (i) => MessageData.createDummy()));
      emit(ChannelMessageLoadSuccess(channelMessages));
    } catch (e) {
      emit(ChannelMessageLoadFailure());
      print(e.toString());
    }
  }

  Stream<ChannelState> _loadChannelInfo() async* {
    print("_loadChannelInfo");
    try {
      emit(ChannelInfoLoadSuccess(Channel.dummy()));
    } catch (e) {
      emit(ChannelLoadInfoFailure());
    }
  }
}
