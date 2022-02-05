import 'dart:async';
import 'package:discord_replicate/model/credential/credential.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

abstract class AuthService implements Disposable {
  Future<Credential?> getCredential({bool forceRefresh = false});

  Future<Credential> signIn(String email, String password);

  Future<Credential> signUpEmail(String email);

  Future<void> signOut();
}

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;
  late Logger log = Logger();

  FirebaseAuthService();

  @override
  Future<Credential?> getCredential({bool forceRefresh = false}) async {
    if (_auth.currentUser == null) return Future.value(null);

    var user = _auth.currentUser;
    var token = await user!.getIdToken(forceRefresh);
    return Credential(uid: user.uid, email: user.email!, token: token);
  }

  Future<Credential> signIn(String email, String password) {
    log.d("Signing in with $email $password");
    return _auth.signInWithEmailAndPassword(email: email, password: password).then((credential) async {
      var user = credential.user!;
      var token = await user.getIdToken(false);
      log.i("Signed in to Firebase");
      return Credential(uid: user.uid, email: user.email!, token: token);
    }).onError((FirebaseAuthException e, st) {
      log.e("Couldn't signing in to Firebase", e.message, st);
      return Future.error(e, st);
    });
  }

  @override
  Future<Credential> signUpEmail(String email) async {
    var credential = await _auth.createUserWithEmailAndPassword(email: email, password: "password").then((firebaseCredential) async {
      var user = firebaseCredential.user!;
      var token = await user.getIdToken(false);
      log.i("Register successful with email $email");
      return Credential(uid: user.uid, email: user.email!, token: token);
    }).onError((error, stackTrace) {
      log.e("Couldn't signup to Firebase", error, stackTrace);
      return Future.error(error!, stackTrace);
    });

    return credential;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut().whenComplete(() {
      log.i("Signed out from Firebase.");
    });
  }

  @override
  FutureOr onDispose() {}
}
