import 'dart:async';

import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/observe_user_changes_usecase.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'user_event.dart';
import 'user_state.dart';

export 'user_event.dart';
export 'user_state.dart';

@Injectable()
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final ObserveUserChangesUseCase _observeUserChangesUseCase;

  final StreamController<UserEvent> _eventStream = StreamController.broadcast();
  Stream<UserEvent> get eventStream => _eventStream.stream;

  final CompositeSubscription _blocStateSubscription = CompositeSubscription();
  StreamSubscription? _userChangesSubscription;

  UserBloc(
    @factoryParam Stream<AuthState> authStateStream,
    this._getCurrentUserUseCase,
    this._observeUserChangesUseCase,
  ) : super(const UserState.empty()) {
    on<UserEvent>((event, emit) async {
      await event.when(
        loadUser: () async => _loadUser(emit),
        deleteUser: () async => _deleteUser(emit),
      );
    });

    authStateStream.doOnListen(() {
      log.d("Listening auth state in UserBloc.");
    }).listen((state) {
      log.d("Received auth state in UserBloc $state");
      state.whenOrNull(
        authenticated: (credential) {
          add(const UserEvent.loadUser());
        },
        unauthenticated: () {
          add(const UserEvent.deleteUser());
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
    _eventStream.close();
    return super.close();
  }

  Future<void> _loadUser(Emitter<UserState> emit) async {
    log.i("Loading user...");
    emit(const UserState.loading());

    await _getCurrentUserUseCase.invoke().then((user) async {
      log.i("User loaded. $user");
      emit(UserState.loaded(user));
      _userChangesSubscription?.cancel();
      _userChangesSubscription = _observeUserChangesUseCase.invoke(userId: user.uid).listen((event) {
        add(const UserEvent.loadUser());
      });
    });
  }

  Future<void> _deleteUser(emit) async {
    _blocStateSubscription.cancel();
    emit(const UserState.empty());
  }
}
