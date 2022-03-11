import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_bloc.dart';

part '__generated/auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initialEvent() = AuthEventInitial;
  const factory AuthEvent.signInEvent({required String id, required String password}) = AuthEventSignIn;
  const factory AuthEvent.signUpEvent({required RegisterOptions option, required String id}) = AuthEventSignUp;
  const factory AuthEvent.signOutEvent() = AuthEventSignOut;
}
