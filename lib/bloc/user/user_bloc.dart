import 'package:discord_ui_practice/model/server_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class UserLoadAllServerInitiate extends UserEvent {}

abstract class UserState {}

class UserLoadAllServerInitial extends UserState {}

class UserLoadAllServerSuccess extends UserState {
  List<ServerData> userServers;

  UserLoadAllServerSuccess(this.userServers);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserLoadAllServerInitial());

  void _loadUserServers() {
    emit(UserLoadAllServerSuccess(List.generate(5, (index) => ServerData.createDummy())));
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadAllServerInitiate) {
      _loadUserServers();
    }
  }
}
