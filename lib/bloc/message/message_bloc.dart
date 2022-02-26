import 'dart:async';

import 'package:discord_replicate/bloc/message/message_event.dart';
import 'package:discord_replicate/bloc/message/message_state.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/interactor/channel/channel_interactor.dart';
import 'package:discord_replicate/interactor/user/user_interactor.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

export 'message_event.dart';
export 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final Channel _channel;
  final UserInteractor _userService;
  final ChannelInteractor _channelInteractor;

  late Logger log = Logger();
  late StreamSubscription _messageSubscription;

  MessageBloc({
    required Channel channel,
    UserInteractor? userService,
    ChannelInteractor? channelInteractor,
  })  : _channel = channel,
        _userService = userService ?? sl.get(),
        _channelInteractor = channelInteractor ?? sl.get(),
        super(MessageState.initial()) {
    on<MessageEvent>((event, emit) => _handleEvent(event, emit));

    add(MessageEvent.fetchInitialMessage());

    _messageSubscription = _channelInteractor.subscribeChannelMessage(channelId: _channel.id).handleError((e, st) {
      log.e("Error in channel subscription.", e, st);
    }).listen((message) {
      log.i("Message received: $message");
      add(MessageEvent.notifyNewMessage(message));
    });
  }

  @override
  Future<void> close() async {
    _messageSubscription.cancel();
    super.close();
  }

  _fetchInitialMessage(emit) async {
    await _channelInteractor.getChannelMessages(channelId: _channel.id).then((response) {
      emit(MessageState.messageFetched(response.items, response.hasMore, response.previousCursor));
    });
  }

  _fetchPreviousMessage(String lastMessageId, int limit, emit) async {
    await _channelInteractor.getChannelMessages(channelId: _channel.id, limit: limit, lastMessageId: lastMessageId).then((response) {
      emit(MessageState.messageFetched(response.items, response.hasMore, response.previousCursor));
    });
  }

  _fetchLatestMessage(emit) async {}

  _sendMessage(String messageText, emit) async {
    var user = await _userService.getCurrentUser();
    var member = await _channelInteractor.getMemberById(channelId: _channel.id, userId: user.uid);

    var date = DateTime.now();
    var message = Message(id: "", sender: member, message: messageText, date: date, status: "Pending");

    emit(MessageState.sendingMessage(message));

    await _channelInteractor
        .sendChannelMessage(channelId: _channel.id, messageText: messageText, timestamp: date.millisecondsSinceEpoch)
        .then((message) {
          log.i("Message sent. $message");
        }).onError((Exception error, stackTrace) {
          log.e("Error when send message.", error, stackTrace);
        });
  }

  _onReceivedNewMessage(Message message, emit) async {
    emit(MessageState.receivedNewMessage(message));
  }

  _handleEvent(MessageEvent event, emit) async {
    return await event.when(
      fetchInitialMessage: () => _fetchInitialMessage(emit),
      fetchPreviousMessage: (lastMessageId, limit) => _fetchPreviousMessage(lastMessageId, limit, emit),
      fetchLatestMessage: () => _fetchLatestMessage(emit),
      sendMessage: (input) => _sendMessage(input, emit),
      notifyNewMessage: (message) => _onReceivedNewMessage(message, emit),
    );
  }
}
