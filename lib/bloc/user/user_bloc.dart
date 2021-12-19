import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) {
    throw UnimplementedError();
  }
}
