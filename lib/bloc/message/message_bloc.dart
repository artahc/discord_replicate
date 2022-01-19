import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/bloc/message/message_event.dart';
import 'package:discord_replicate/bloc/message/message_state.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/service/message_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

export 'message_event.dart';
export 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final Channel _channel;
  final ChannelRepository _channelRepo;
  final MessageService _service;

  late Logger log = Logger();
  late StreamSubscription _channelSubscription;

  MessageBloc({required Channel channel, required ChannelRepository channelRepo, required MessageService service})
      : _channel = channel,
        _channelRepo = channelRepo,
        _service = service,
        super(MessageState.initial()) {
    on<MessageEvent>((event, emit) => _handleEvent(event, emit));

    _channelSubscription = _service.subscribe(_channel.id).handleError((e, st) {
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
    // todo: construct pending message with dummy-id, and emit new pending message state
    await _service.sendMessage(input, _channel.id).then((message) {
      // todo: save message to local db
      // todo: delete temporary message with dummy-id
      log.d("Message sent. $message");
      emit(MessageState.onReceiveNewMessage(message));
    });
  }

  _onNewMessage(Message message, emit) {
    // todo: save to local db
    log.d("Received new message. $message");
    emit(MessageState.onReceiveNewMessage(message));
  }

  _handleEvent(MessageEvent event, emit) async {
    return await event.when(
      sendMessage: (input) => _sendMessage(input, emit),
      notifyNewMessage: (message) => _onNewMessage(message, emit),
    );
  }
}
