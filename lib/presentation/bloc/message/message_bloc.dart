import 'dart:async';

import 'package:discord_replicate/common/app_logger.dart';
import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/message/message.dart';

import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';

import 'package:discord_replicate/common/app_config.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_event.dart';
import 'message_state.dart';

export 'message_event.dart';
export 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final Channel _channel;

  late StreamSubscription _messageSubscription;

  // Use Cases
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SubscribeChannelMessageUseCase _subscribeChannelMessageUseCase;
  final GetChannelMessagesUseCase _getChannelMessagesUseCase;
  final GetChannelMemberByIdUseCase _getChannelMemberByIdUseCase;
  final SendChannelMessageUseCase _sendChannelMessageUseCase;

  MessageBloc({
    required Channel channel,
    GetCurrentUserUseCase? getCurrentUserUseCase,
    SubscribeChannelMessageUseCase? subscribeChannelMessageUseCase,
    GetChannelMessagesUseCase? getChannelMessagesUseCase,
    GetChannelMemberByIdUseCase? getChannelMemberByIdUseCase,
    SendChannelMessageUseCase? sendChannelMessageUseCase,
  })  : _channel = channel,
        _getCurrentUserUseCase = getCurrentUserUseCase ?? sl.get(),
        _subscribeChannelMessageUseCase = subscribeChannelMessageUseCase ?? sl.get(),
        _getChannelMessagesUseCase = getChannelMessagesUseCase ?? sl.get(),
        _getChannelMemberByIdUseCase = getChannelMemberByIdUseCase ?? sl.get(),
        _sendChannelMessageUseCase = sendChannelMessageUseCase ?? sl.get(),
        super(MessageState.initial()) {
    on<MessageEvent>((event, emit) => _handleEvent(event, emit));

    add(MessageEvent.fetchInitialMessage());

    _messageSubscription = _subscribeChannelMessageUseCase.invoke(channelId: _channel.id).handleError((e, st) {
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
    await _getChannelMessagesUseCase.invoke(channelId: _channel.id).then((response) {
      emit(MessageState.messageFetched(response.items, response.hasMore, response.cursor));
    });
  }

  _fetchPreviousMessage(String lastMessageId, int limit, emit) async {
    await _getChannelMessagesUseCase.invoke(channelId: _channel.id, limit: limit, lastMessageId: lastMessageId).then((response) {
      emit(MessageState.messageFetched(response.items, response.hasMore, response.cursor));
    });
  }

  _fetchLatestMessage(emit) async {}

  _sendMessage(String messageText, emit) async {
    var user = await _getCurrentUserUseCase.invoke();
    var member = await _getChannelMemberByIdUseCase.invoke(channelId: _channel.id, userId: user.uid);

    var date = DateTime.now();
    var message = Message(id: "", sender: member, message: messageText, date: date, status: "Pending");

    emit(MessageState.sendingMessage(message));

    await _sendChannelMessageUseCase.invoke(channelId: _channel.id, messageText: messageText, date: date).then((message) {
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
