import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/repository/auth_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepo;
  final AuthRepository authRepo;

  UserBloc({required this.userRepo, required this.authRepo}) : super(UserState.initial());

  Stream<UserState> _loadLocalUser() async* {
    emit(UserState.loadLocalUserInProgress());

    var credential = await authRepo.getCurrentUserCredential();
    if (credential == null)
      emit(UserState.loadLocalUserFailed(Exception("Current user session not found.")));
    else {
      var user = await userRepo.loadLocalUser(credential.uid);
      emit(UserState.loadLocalUserSuccess(user));
    }
  }

  Stream<UserState> _loadRemoteUser(String uid) async* {
    var user = await userRepo.loadLocalUser(uid);
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    yield* event.when(
      loadLocalUser: _loadLocalUser,
      loadRemoteUser: _loadRemoteUser,
    );
  }
}
