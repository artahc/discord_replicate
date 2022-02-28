import 'dart:async';
import 'package:discord_replicate/domain/model/credential/credential.dart';

import 'package:get_it/get_it.dart';

abstract class AuthRepository implements Disposable {
  Future<Credential?> getCredential({bool forceRefresh = false});
  Future<Credential> signIn(String email, String password);
  Future<Credential> signUpEmail(String email);
  Future<void> signOut();
}
