import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:discord_replicate/bloc/message/message_event.dart';
import 'package:discord_replicate/bloc/message/message_state.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/message_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

export 'message_event.dart';
export 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final Channel _channel;
  final UserRepository _userRepo;
  final ChannelRepository _channelRepo;

  late Logger log = Logger();
  late StreamSubscription _channelSubscription;

  MessageBloc({
    required Channel channel,
    ChannelRepository? channelRepository,
    UserRepository? userRepo,
  })  : _channel = channel,
        _userRepo = userRepo ?? GetIt.I.get<UserRepository>(),
        _channelRepo = channelRepository ?? GetIt.I.get<ChannelRepository>(),
        super(MessageState.initial()) {
    on<MessageEvent>((event, emit) => _handleEvent(event, emit));

    _channelSubscription = _channelRepo.subscribeChannelMessage(_channel.id).handleError((e, st) {
      log.e("Error in channel subscription.", e, st);
    }).listen((message) {
      add(MessageEvent.notifyNewMessage(message));
    });
  }

  @override
  Future<void> close() async {
    _channelSubscription.cancel();
    super.close();
  }

  _sendMessage(String input, emit) async {
    var user = _userRepo.getCurrentUser()!;
    var date = DateTime.now();
    var pendingMessage = Message(id: "", sender: user, message: input, date: date);

    emit(MessageState.sending(pendingMessage));

    await _channelRepo.sendMessage(_channel.id, pendingMessage).then((message) {
      _channel.messages.add(message);
      log.d("Message sent. ${message.toJson()}");
    });
  }

  _onReceivedNewMessage(Message message, emit) {
    log.d("Received new message. $message");
    emit(MessageState.receivedNewMessage(message));
  }

  _handleEvent(MessageEvent event, emit) async {
    return await event.when(
      sendMessage: (input) => _sendMessage(input, emit),
      notifyNewMessage: (message) => _onReceivedNewMessage(message, emit),
    );
  }
}
