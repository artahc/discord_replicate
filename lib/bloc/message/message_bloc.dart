import 'dart:async';

import 'package:discord_replicate/bloc/message/message_event.dart';
import 'package:discord_replicate/bloc/message/message_state.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/service/channel_service.dart';
import 'package:discord_replicate/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

export 'message_event.dart';
export 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final Channel _channel;
  final UserService _userService;
  final ChannelService _channelService;

  late Logger log = Logger();
  late StreamSubscription _messageSubscription;

  MessageBloc({
    required Channel channel,
    UserService? userService,
    ChannelService? channelService,
  })  : _channel = channel,
        _userService = userService ?? GetIt.I.get<UserService>(),
        _channelService = channelService ?? GetIt.I.get<ChannelService>(),
        super(MessageState.initial()) {
    on<MessageEvent>((event, emit) => _handleEvent(event, emit));

    add(MessageEvent.fetchInitialMessage());

    _messageSubscription = _channelService.subscribeChannelMessage(_channel.id).handleError((e, st) {
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
    await _channelService.getMessages(_channel.id, 5, null).then((response) {
      emit(MessageState.messageFetched(response.items, response.hasMore, response.previousCursor));
    });
  }

  _fetchPreviousMessage(String lastMessageId, int limit, emit) async {
    await _channelService.getMessages(_channel.id, limit, lastMessageId).then((response) {
      emit(MessageState.messageFetched(response.items, response.hasMore, response.previousCursor));
    });
  }

  _fetchLatestMessage(emit) async {}

  _sendMessage(String input, emit) async {
    var user = await _userService.getCurrentUser();
    var member = await _channelService.getMemberById(_channel.id, user.uid);

    var date = DateTime.now();
    var message = Message(id: "", sender: member, message: input, date: date, status: "Pending");

    emit(MessageState.sendingMessage(message));

    await _channelService.sendMessage(_channel.id, input, date.millisecondsSinceEpoch).then((message) {
      log.i("Message sent. $message");
    }, onError: (e, st) {
      log.e(e, st);
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
