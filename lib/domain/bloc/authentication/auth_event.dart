import 'package:discord_replicate/domain/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {
  AuthEvent._();

  factory AuthEvent.initialEvent() = AuthInitialEvent;
  factory AuthEvent.signInEvent({required String id, required String password}) = AuthSignInEvent;
  factory AuthEvent.signUpEvent({required RegisterOptions option, required String id}) = AuthSignUpEvent;
  factory AuthEvent.signOutEvent() = AuthSignOutEvent;
}

class AuthInitialEvent extends AuthEvent {
  AuthInitialEvent() : super._();
}

class AuthSignInEvent extends AuthEvent {
  final String id;
  final String password;

  AuthSignInEvent({required this.id, required this.password}) : super._();
}

class AuthSignUpEvent extends AuthEvent {
  final RegisterOptions option;
  final String id;

  AuthSignUpEvent({required this.option, required this.id}) : super._();
}

class AuthSignOutEvent extends AuthEvent {
  AuthSignOutEvent() : super._();
}
