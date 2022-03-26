import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_bloc.dart';

part 'generated/auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initial() = AuthEventInitial;
  const factory AuthEvent.signIn({required String id, required String password}) = AuthEventSignIn;
  const factory AuthEvent.signUp({required RegisterOptions option, required String id}) = AuthEventSignUp;
  const factory AuthEvent.signOut() = AuthEventSignOut;
}
