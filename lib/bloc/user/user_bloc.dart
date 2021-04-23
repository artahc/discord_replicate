import 'package:discord_ui_practice/model/server_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class UserLoadJoinedServerInitiate extends UserEvent {}

abstract class UserState {}

class UserLoadJoinedServerInitial extends UserState {}

class UserLoadJoinedServerSuccess extends UserState {
  List<ServerData> userServers;

  UserLoadJoinedServerSuccess(this.userServers);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoadJoinedServerInitial());

  void _loadUserServers() {
    emit(UserLoadJoinedServerSuccess(List.generate(5, (index) => ServerData.createDummy())));
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadJoinedServerInitiate) {
      _loadUserServers();
    }
  }
}
