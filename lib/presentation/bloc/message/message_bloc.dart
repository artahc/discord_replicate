import 'dart:async';
import 'dart:collection';

import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'message_event.dart';
import 'message_state.dart';

export 'message_event.dart';
export 'message_state.dart';

@Injectable()
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SubscribeChannelMessageUseCase _subscribeChannelMessageUseCase;
  final GetChannelMessagesUseCase _getChannelMessagesUseCase;
  final GetChannelMemberByIdUseCase _getChannelMemberByIdUseCase;
  final SendChannelMessageUseCase _sendChannelMessageUseCase;

  StreamSubscription<Message>? _messageSubs;
  StreamSubscription<ChannelState>? _channelStateSubs;

  late Channel _channel;

  MessageBloc(
    @factoryParam Stream<ChannelState> channelStateStream,
    this._getCurrentUserUseCase,
    this._subscribeChannelMessageUseCase,
    this._getChannelMessagesUseCase,
    this._getChannelMemberByIdUseCase,
    this._sendChannelMessageUseCase,
  ) : super(MessageState()) {
    on<MessageEvent>((event, emit) async {
      await event.when(
        refresh: (messages, pendingMessages) => _refresh(messages, pendingMessages, emit),
        fetchPreviousMessage: (int limit) => _fetchPreviousMessage(emit),
        fetchLatestMessage: () => _fetchLatestMessage(emit),
        sendMessage: (text) => _sendMessage(text, emit),
        notifyNewMessage: (Message message) => _notifyNewMessage(message, emit),
      );
    });

    _channelStateSubs = channelStateStream.listen((state) {
      state.maybeWhen(
        orElse: () {},
        loading: () {},
        loaded: (channel) {
          this._channel = channel;
          add(MessageEvent.refresh(channel.messages, []));
        },
      );
    });
  }

  @override
  Future<void> close() async {
    _channelStateSubs?.cancel();
    _messageSubs?.cancel();
    super.close();
  }

  Future<void> _notifyNewMessage(Message message, emit) async {
    var currentUser = await _getCurrentUserUseCase.invoke();
    if (message.senderRef != currentUser.uid) {
      emit(
        state.copyWith(
          messages: state.messages..add(message),
          pendingMessages: state.pendingMessages,
        ),
      );
    }
  }

  Future<void> _refresh(List<Message> messages, List<Message> pendingMessages, emit) async {
    emit(MessageState(messages: messages, pendingMessages: pendingMessages));
    _messageSubs?.cancel();
    _messageSubs = _subscribeChannelMessageUseCase.invoke(channelId: _channel.id).listen((newMessage) {
      add(MessageEvent.notifyNewMessage(newMessage));
    });
  }

  Future<void> _fetchPreviousMessage(emit) async {
    await _getChannelMessagesUseCase
        .invoke(channelId: _channel.id, limit: 5, lastMessageId: _channel.messages.first.id)
        .then((response) {
      emit(state.copyWith(messages: response.items));
    });
  }

  Future<void> _fetchLatestMessage(emit) async {}

  Future<void> _sendMessage(String plainMessage, emit) async {
    var date = DateTime.now();
    var currentUserId = await _getCurrentUserUseCase.invoke().then((user) => user.uid);
    var pendingMessage = Message.pending(senderRef: currentUserId, date: date, message: plainMessage);

    emit(
      state.copyWith(
        messages: [...state.messages],
        pendingMessages: [...state.pendingMessages, pendingMessage].toList(),
      ),
    );

    await _sendChannelMessageUseCase
        .invoke(channelId: _channel.id, messageText: plainMessage, date: date)
        .then((message) async {
      emit(
        state.copyWith(
          messages: [...state.messages, message],
          pendingMessages: state.pendingMessages.toList()
            ..removeWhere((element) => element.contentHash == message.contentHash),
        ),
      );
    });
  }
}
