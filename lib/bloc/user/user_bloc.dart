import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<int, int> {
  UserBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(int event) async* {
    yield* _loadUserServers();
  }

  Stream<int> _loadUserServers() async* {
    await Future.value(1);
  }
}
