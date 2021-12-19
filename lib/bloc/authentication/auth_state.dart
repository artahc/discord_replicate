import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.signingIn() = AuthStateSigningIn;
  const factory AuthState.signedIn({required Credential credential}) = AuthStateSignedIn;
  const factory AuthState.signedOut() = AuthStateSignedOut;
  const factory AuthState.error({required Exception exception}) = AuthStateError;
}
