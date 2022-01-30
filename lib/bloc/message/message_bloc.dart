import 'dart:async';

import 'package:discord_replicate/bloc/message/message_event.dart';
import 'package:discord_replicate/bloc/message/message_state.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
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

    _messageSubscription = _channelService.subscribeMessage(_channel.id).handleError((e, st) {
      log.e("Error in channel subscription.", e, st);
    }).listen((message) {
      add(MessageEvent.notifyNewMessage(message));
    });
  }

  @override
  Future<void> close() async {
    _messageSubscription.cancel();
    super.close();
  }

  _fetchInitialMessage(emit) async {
    await _channelService.fetchMessages(_channel.id).then((messages) {
      emit(MessageState.messageFetched(messages));
    });
  }

  _sendMessage(String input, emit) async {
    var user = await _userService.getCurrentUser();
    var member = await _channelService.getMemberById(_channel.userGroupRef, user.uid);

    var date = DateTime.now();
    var pendingMessage = Message.pending(sender: member, message: input, date: date);

    emit(MessageState.sendingMessage(pendingMessage as PendingMessage));

    await _channelService.sendMessage(_channel.id, pendingMessage).then((message) {
      log.d("Message sent. ${message.toJson()}");
    });
  }

  _onReceivedNewMessage(MessageWithMember message, emit) async {
    log.d("Received new message. $message");
    emit(MessageState.receivedNewMessage(message));
  }

  _handleEvent(MessageEvent event, emit) async {
    return await event.when(
      fetchInitialMessage: () => _fetchInitialMessage(emit),
      sendMessage: (input) => _sendMessage(input, emit),
      notifyNewMessage: (message) => _onReceivedNewMessage(message, emit),
    );
  }
}
