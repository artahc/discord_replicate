import 'package:discord_replicate/domain/services/firebase_auth_service.dart';
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
