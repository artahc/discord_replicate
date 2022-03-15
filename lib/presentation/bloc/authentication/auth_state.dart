import 'package:discord_replicate/domain/model/credential.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.authenticating() = AuthStateSigningIn;
  const factory AuthState.authenticated({required Credential credential}) = AuthStateSignedIn;
  const factory AuthState.unauthenticated() = AuthStateSignedOut;

  const factory AuthState.error({required Exception exception}) = AuthStateError;
}
