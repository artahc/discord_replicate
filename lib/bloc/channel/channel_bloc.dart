import 'dart:async';

import 'package:discord_replicate/bloc/channel/channel_event.dart';
import 'package:discord_replicate/bloc/channel/channel_state.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

export 'channel_event.dart';
export 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  StreamController<ChannelEvent> _eventStream = StreamController.broadcast();
  Stream<ChannelEvent> get eventStream => _eventStream.stream;

  final ServerBloc _serverBloc;
  final UserBloc _userBloc;
  final ChannelRepository _channelRepository;

  late Logger log = Logger();
  late StreamSubscription<ServerState> _serverStateSubscription;
  late StreamSubscription<UserState> _userStateSubscription;
  late Channel current;

  ChannelBloc({
    required ChannelRepository channelRepository,
    required ServerBloc serverBloc,
    required UserBloc userBloc,
  })  : _channelRepository = channelRepository,
        _serverBloc = serverBloc,
        _userBloc = userBloc,
        super(ChannelState.initial()) {
    on<ChannelEvent>((event, emit) => _handleEvent(event, emit));

    _userStateSubscription = _userBloc.stream.listen((state) {
      state.whenOrNull(
        loadUserSuccess: (user) {
          add(ChannelEvent.loadRecentPrivate());
        },
      );
    });

    _serverStateSubscription = _serverBloc.stream.listen((state) {
      state.whenOrNull(
        loadServerSuccess: (server, recentChannel) {
          add(ChannelEvent.loadChannel(recentChannel.id));
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
    _userStateSubscription.cancel();
    super.close();
  }

  _loadRecentPrivate(emit) async {
    await _load("PkM6m7lhnvIORIRuoVJv", emit);
  }

  _load(String id, emit) async {
    emit(ChannelState.loadInProgress());
    await _channelRepository.load(id).then((channel) {
      this.current = channel;
      emit(ChannelState.loadSuccess(channel));
    });
  }

  _handleEvent(ChannelEvent event, emit) async {
    return await event.when(
      loadRecentPrivate: () => _loadRecentPrivate(emit),
      loadChannel: (id) => _load(id, emit),
    );
  }
}
