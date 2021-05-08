import 'package:discord_ui_practice/bloc/server/server_event.dart';
import 'package:discord_ui_practice/bloc/server/server_state.dart';
import 'package:discord_ui_practice/method_channel/networking_channel.dart';
import 'package:discord_ui_practice/model/channel_data.dart';
import 'package:discord_ui_practice/model/server_data.dart';
import 'package:discord_ui_practice/repository/server_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

/// Consider deleting this or merge functionality with server bloc
class ServerBloc extends Bloc<ServerEvent, ServerState> {
  final NetworkingMethodChannel _networkApi;
  final ServerRepository _repository;
  ServerBloc(this._repository, this._networkApi) : super(ServerLoadAllInitial());

  @override
  Stream<ServerState> mapEventToState(ServerEvent event) async* {
    if (event is ServerLoadAll) {
      await emit(ServerLoadAllSuccess(
        List.from(Iterable<ServerData>.generate(30, (i) => SingleServerData.createDummy())),
      ));
    }
  }

  Stream<List<ChannelData>> _loadChannel() async* {
    await Future.value([ChannelData("channelName")]);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
