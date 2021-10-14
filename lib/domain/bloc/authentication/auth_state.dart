import 'package:discord_replicate/data/repository/firebase_auth_repository.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateSignedIn extends AuthState {
  final UserCredential credential;

  AuthStateSignedIn({required this.credential});
}

class AuthStateSignedOut extends AuthState {}

class AuthStateError extends AuthState {
  final Exception error;

  AuthStateError(this.error);
}
