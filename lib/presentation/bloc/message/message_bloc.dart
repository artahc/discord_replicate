import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:discord_replicate/application/config/injection.dart';
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
import 'package:rxdart/rxdart.dart';

import 'message_event.dart';
import 'message_state.dart';

export 'message_event.dart';
export 'message_state.dart';

@Injectable()
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  Channel channel;

  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SubscribeChannelMessageUseCase _subscribeChannelMessageUseCase;
  final GetChannelMessagesUseCase _getChannelMessagesUseCase;
  final GetChannelMemberByIdUseCase _getChannelMemberByIdUseCase;
  final SendChannelMessageUseCase _sendChannelMessageUseCase;

  StreamSubscription<Message>? _messageSubs;
  StreamSubscription<ChannelState>? _channelStateSubs;

  Queue<Message> _messageQueue = Queue();

  MessageBloc(
    @factoryParam this.channel,
    @factoryParam Stream<ChannelState> channelStateStream,
    this._getCurrentUserUseCase,
    this._subscribeChannelMessageUseCase,
    this._getChannelMessagesUseCase,
    this._getChannelMemberByIdUseCase,
    this._sendChannelMessageUseCase,
  ) : super(MessageState.initial()) {
    on<MessageEvent>((event, emit) async {
      await event.when(
        refresh: () => _refresh(emit),
        fetchPreviousMessage: (int limit) => _fetchPreviousMessage(emit),
        fetchLatestMessage: () => _fetchLatestMessage(emit),
        sendMessage: (text) => _sendMessage(text, emit),
      );
    });

    _channelStateSubs = channelStateStream.listen((state) {
      state.whenOrNull(
        loading: () {},
        loaded: (channel) {
          add(MessageEvent.refresh());
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

  Future<void> _refresh(emit) async {
    emit(MessageState.loaded(channel.messages));
    _messageSubs?.cancel();
    _messageSubs = _subscribeChannelMessageUseCase.invoke(channelId: channel.id).listen((newMessage) {
      this.state.when(
            initial: () {},
            loading: () {},
            loaded: (messages) {
              emit(MessageState.loaded([...messages, newMessage, ..._messageQueue.toList()]));
            },
          );
    });
  }

  Future<void> _fetchPreviousMessage(emit) async {
    await _getChannelMessagesUseCase
        .invoke(channelId: channel.id, limit: 5, lastMessageId: channel.messages.first.id)
        .then((response) {
      emit(MessageState.loaded(response.items));
    });
  }

  Future<void> _fetchLatestMessage(emit) async {}

  Future<void> _sendMessage(String plainMessage, emit) async {
    var date = DateTime.now();
    var currentUserId = await _getCurrentUserUseCase.invoke().then((user) => user.uid);
    var pendingMessage = Message.pending(senderRef: currentUserId, date: date, message: plainMessage);

    _messageQueue.addLast(pendingMessage);
    var state = this.state.when(
          initial: () => MessageState.initial(),
          loading: () => MessageState.loading(),
          loaded: (messages) => MessageState.loaded([...messages, ..._messageQueue.toList()]),
        );

    print(_messageQueue.length);
    emit(state);

    await _sendChannelMessageUseCase
        .invoke(channelId: channel.id, messageText: plainMessage, date: date)
        .then((message) {
      _messageQueue.removeWhere((e) => e.contentHash == message.contentHash);
      log.d("Message sent.");
      print(_messageQueue.length);

      var state = this.state.when(
            initial: () => MessageState.initial(),
            loading: () => MessageState.loading(),
            loaded: (messages) => MessageState.loaded([...messages, message, ..._messageQueue.toList()]),
          );
      emit(state);
    });
  }
}
