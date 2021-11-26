import 'package:discord_replicate/repository/firebase_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.signedIn({required UserCredential credential}) = AuthStateSignedIn;
  const factory AuthState.signedOut() = AuthStateSignedOut;
  const factory AuthState.error({required Exception exception}) = AuthStateError;
}
