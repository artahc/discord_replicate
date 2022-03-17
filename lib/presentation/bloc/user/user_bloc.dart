import 'dart:async';

import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/application/usecase/user/observe_user_changes_usecase.dart';
import 'package:discord_replicate/application/usecase/user/get_current_user_usecase.dart';

import 'package:discord_replicate/domain/model/observable_entity_event.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'user_event.dart';
import 'user_state.dart';

export 'user_event.dart';
export 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  StreamController<UserEvent> _eventStream = StreamController.broadcast();
  Stream<UserEvent> get eventStream => _eventStream.stream;

  CompositeSubscription _blocStateSubscription = CompositeSubscription();
  StreamSubscription? _userChangesSubscription;

  // Use Cases
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final ObserveUserChangesUseCase _observeUserChangesUseCase;

  UserBloc({
    required Stream<AuthState> authStateStream,
    GetCurrentUserUseCase? getCurrentUserUseCase,
    ObserveUserChangesUseCase? observeUserChangesUseCase,
  })  : _getCurrentUserUseCase = getCurrentUserUseCase ?? sl.get(),
        _observeUserChangesUseCase = observeUserChangesUseCase ?? sl.get(),
        super(UserState.empty()) {
    on<UserEvent>((event, emit) {
      return event.when(
        loadUser: () async => await _loadUser(emit),
        deleteUser: () async => await _deleteUser(emit),
      );
    });

    authStateStream.listen((state) {
      state.whenOrNull(
        authenticated: (credential) {
          add(UserEvent.loadUser());
        },
        unauthenticated: () {
          add(UserEvent.deleteUser());
        },
      );
    }).addTo(_blocStateSubscription);
  }

  @override
  void onEvent(UserEvent event) {
    _eventStream.sink.add(event);
    super.onEvent(event);
  }

  @override
  Future<void> close() {
    _blocStateSubscription.cancel();
    _userChangesSubscription?.cancel();
    _eventStream.close();
    return super.close();
  }

  Future<void> _loadUser(Emitter<UserState> emit) async {
    emit(UserState.loading());

    await _getCurrentUserUseCase.invoke().then((user) async {
      print("Listening to user changes");
      emit(UserState.loaded(user));

      await for (final event in _observeUserChangesUseCase.invoke().where((event) => event.key == user.uid)) {
        if (event.event == EntityEvent.CREATED_OR_UPDATED) {
          emit(UserState.loaded(event.value!));
        } else {
          emit(UserState.empty());
        }
      }
    }).catchError((error, stackTrace) {
      log.e("Error when loading user after sign-in.", error, stackTrace);
      emit(UserState.error(error));
    });
  }

  Future<void> _deleteUser(emit) async {
    _userChangesSubscription?.cancel();
    emit(UserState.empty());
  }
}
