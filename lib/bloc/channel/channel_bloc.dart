import 'dart:async';

import 'package:discord_replicate/bloc/channel/channel_event.dart';
import 'package:discord_replicate/bloc/channel/channel_state.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/service/channel_service.dart';
import 'package:discord_replicate/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

export 'channel_event.dart';
export 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final StreamController<ChannelEvent> _eventStream = StreamController.broadcast();
  Stream<ChannelEvent> get eventStream => _eventStream.stream;

  final ServerBloc _serverBloc;
  final DirectMessageBloc _dmBloc;
  final UserService _userService;
  final ChannelService _channelService;

  late Logger log = Logger();
  late StreamSubscription<ServerState> _serverStateSubscription;
  late StreamSubscription<DirectMessageState> _dmStateSubscription;

  ChannelBloc({
    required ServerBloc serverBloc,
    required DirectMessageBloc dmBloc,
    ChannelService? channelService,
    UserService? userService,
  })  : _serverBloc = serverBloc,
        _dmBloc = dmBloc,
        _userService = userService ?? GetIt.I.get<UserService>(),
        _channelService = channelService ?? GetIt.I.get<ChannelService>(),
        super(ChannelState.loading()) {
    on<ChannelEvent>((event, emit) => _handleEvent(event, emit));

    _dmStateSubscription = dmBloc.stream.listen((event) {
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

    await _channelService.getChannelById(id).then((channel) {
      emit(ChannelState.loaded(channel));
    });
  }

  _handleEvent(ChannelEvent event, emit) async {
    return await event.when(
      load: (id) => _load(id, emit),
    );
  }
}
