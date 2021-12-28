import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/auth_service.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepo;
  final AuthService authService;

  UserBloc({required this.userRepo, required this.authService}) : super(UserState.initial());

  Stream<UserState> _loadLocalUser() async* {
    emit(UserState.loadLocalUserInProgress());

    var credential = await authService.getCurrentUserCredential();
    if (credential == null)
      emit(UserState.loadLocalUserFailed(Exception("Local user not found. Please login first.")));
    else {
      var user = await userRepo.loadUser(credential.uid);
      emit(UserState.loadLocalUserSuccess(user));
    }
  }

  Stream<UserState> _loadRemoteUser(String uid) async* {
    var user = await userRepo.loadUser(uid);
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    yield* event.when(
      loadLocalUser: _loadLocalUser,
      loadRemoteUser: _loadRemoteUser,
    );
  }
}
