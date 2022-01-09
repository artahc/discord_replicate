import 'dart:async';
import 'dart:developer';

import 'package:discord_replicate/model/channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'direct_message_bloc.freezed.dart';

@freezed
abstract class DirectMessageEvent with _$DirectMessageEvent {
  const factory DirectMessageEvent.load(String id) = DirectMessageEventLoad;
}

@freezed
abstract class DirectMessageState with _$DirectMessageState {
  const factory DirectMessageState.initial() = DirectMessageStateInitial;
  const factory DirectMessageState.loadInProgress() = DirectMessageStateLoadInProgress;
  const factory DirectMessageState.loadSuccess(Channel room) = DirectMessageStateLoadSuccess;
  const factory DirectMessageState.loadFailed(Exception e) = DirectMessageStateLoadFailed;
}

class DirectMessageBloc extends Bloc<DirectMessageEvent, DirectMessageState> {
  StreamController<DirectMessageEvent> _eventStream = StreamController.broadcast();
  Stream<DirectMessageEvent> get eventStream => _eventStream.stream;

  DirectMessageBloc() : super(DirectMessageState.initial()) {
    on<DirectMessageEvent>((event, emit) => _handleEvent(event, emit));
  }

  @override
  void onEvent(DirectMessageEvent event) {
    _eventStream.sink.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() async {
    _eventStream.close();
    super.close();
  }

  _load(String id, emit) async {
    emit(DirectMessageState.loadInProgress());
    await Future.delayed(Duration(seconds: 3)).then((value) => emit(DirectMessageState.loadSuccess(Channel.dummy())));
  }

  _handleEvent(DirectMessageEvent event, emit) async {
    return await event.maybeWhen(
      orElse: () {},
      load: (id) => _load(id, emit),
    );
  }
}
