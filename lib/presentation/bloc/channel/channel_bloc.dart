import 'dart:async';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart';

import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'channel_event.dart';
import 'channel_state.dart';

export 'channel_event.dart';
export 'channel_state.dart';

@Injectable()
class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final ServerBloc _serverBloc;
  final DirectMessageBloc _dmBloc;
  final GetChannelByIdUseCase _getChannelByIdUseCase;

  StreamController<ChannelEvent> _eventStream = StreamController.broadcast();
  Stream<ChannelEvent> get eventStream => _eventStream.stream;

  late StreamSubscription<ServerState> _serverStateSubscription;
  late StreamSubscription<DirectMessageState> _dmStateSubscription;

  ChannelBloc(
    @factoryParam this._serverBloc,
    @factoryParam this._dmBloc,
    this._getChannelByIdUseCase,
  ) : super(ChannelState.empty()) {
    on<ChannelEvent>((event, emit) => _handleEvent(event, emit));

    _dmStateSubscription = _dmBloc.stream.listen((event) {
      event.whenOrNull(
        loaded: (channel) {
          add(ChannelEvent.load(channel.id));
        },
      );
    });

    _serverStateSubscription = _serverBloc.stream.listen((state) {
      state.whenOrNull(
        loaded: (server, recentChannel) {
          add(ChannelEvent.load(recentChannel.id));
        },
      );
    });
  }

  @override
  void onEvent(ChannelEvent event) {
    _eventStream.sink.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() async {
    _eventStream.close();
    _serverStateSubscription.cancel();
    _dmStateSubscription.cancel();
    super.close();
  }

  _load(String channelId, emit) async {
    emit(ChannelState.loading());

    await _getChannelByIdUseCase.invoke(channelId: channelId).then((channel) {
      emit(ChannelState.loaded(channel: channel));
    });
  }

  _handleEvent(ChannelEvent event, emit) async {
    return await event.when(
      load: (id) => _load(id, emit),
    );
  }
}
