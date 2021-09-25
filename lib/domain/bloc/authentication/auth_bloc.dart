import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent {}

abstract class AuthState {}

class AuthStateNotAuthenticated extends AuthState {}


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateNotAuthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStateNotAuthenticated) {
      print("User is not authenticated");
    }
  }
}