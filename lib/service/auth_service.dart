import 'dart:async';
import 'package:discord_replicate/model/credential/credential.dart';
import 'package:get_it/get_it.dart';

export 'firebase_auth_service_impl.dart';

abstract class AuthService implements Disposable {
  Future<Credential?> getCredential({bool forceRefresh = false});
  Future<Credential> signIn(String email, String password);
  Future<Credential> signUpEmail(String email);
  Future<void> signOut();
}
