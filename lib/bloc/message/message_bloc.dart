import 'dart:developer';

import 'package:discord_replicate/bloc/message/message_event.dart';
import 'package:discord_replicate/bloc/message/message_state.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'message_event.dart';
export 'message_state.dart';

/// Handles message subscription when opening a channel.
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final Channel _channel;
  final ChannelRepository _channelRepo;

  MessageBloc({required Channel channel, required ChannelRepository channelRepo})
      : _channel = channel,
        _channelRepo = channelRepo,
        super(MessageState.initial()) {
    on<MessageEvent>((event, emit) => _handleEvent(event, emit));
  }

  _sendMessage(Message message, emit) async {
    log("Saving new message for channel ${_channel.id}", name: runtimeType.toString());

    _channel.messages.add(message);
    _channel.save();
    emit(MessageState.onReceiveNewMessage(message));
  }

  _handleEvent(MessageEvent event, emit) async {
    return await event.when(
      sendMessage: (message) => _sendMessage(message, emit),
    );
  }
}
