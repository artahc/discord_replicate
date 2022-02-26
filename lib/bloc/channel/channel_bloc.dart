import 'dart:async';

import 'package:discord_replicate/bloc/channel/channel_event.dart';
import 'package:discord_replicate/bloc/channel/channel_state.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/interactor/channel_interactor.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

export 'channel_event.dart';
export 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final Logger log = Logger();

  final ServerBloc _serverBloc;
  final DirectMessageBloc _dmBloc;
  final ChannelInteractor _channelInteractor;

  final StreamController<ChannelEvent> _eventStream = StreamController.broadcast();
  Stream<ChannelEvent> get eventStream => _eventStream.stream;

  late StreamSubscription<ServerState> _serverStateSubscription;
  late StreamSubscription<DirectMessageState> _dmStateSubscription;

  ChannelBloc({
    required ServerBloc serverBloc,
    required DirectMessageBloc dmBloc,
    ChannelInteractor? channelInteractor,
  })  : _serverBloc = serverBloc,
        _dmBloc = dmBloc,
        _channelInteractor = channelInteractor ?? sl.get(),
        super(ChannelState.loading()) {
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

  _load(String id, emit) async {
    emit(ChannelState.loading());

    await _channelInteractor.getChannelById(id: id).then((channel) {
      emit(ChannelState.loaded(channel: channel));
    });

  }

  _handleEvent(ChannelEvent event, emit) async {
    return await event.when(
      load: (id) => _load(id, emit),
    );
  }
}
