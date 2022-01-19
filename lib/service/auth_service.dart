import 'dart:async';
import 'package:discord_replicate/model/credential.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

abstract class AuthService {
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
    if (_auth.currentUser == null)
      return Future.value(null);
    else {
      var user = _auth.currentUser;
      var token = await user!.getIdToken(forceRefresh);
      return Credential(uid: user.uid, email: user.email!, token: token);
    }
  }

  Future<Credential> signIn(String email, String password) {
    log.d("Signing in to Firebase.");
    return _auth.signInWithEmailAndPassword(email: email, password: password).then((credential) async {
      var user = credential.user!;
      var token = await user.getIdToken(false);
      return Credential(uid: user.uid, email: user.email!, token: token);
    }).whenComplete(() {
      log.d("Signed in to Firebase");
    }).onError((e, st) {
      log.e("Couldn't signing in to Firebase", e, st);
      return Future.error(e!, st);
    });
  }

  @override
  Future<Credential> signUpEmail(String email) {
    return _auth.createUserWithEmailAndPassword(email: email, password: "password").then((credential) async {
      var user = credential.user!;
      var token = await user.getIdToken(false);
      return Credential(uid: user.uid, email: user.email!, token: token);
    }).onError((error, stackTrace) {
      log.e("Couldn't signup to Firebase", error, stackTrace);
      return Future.error(error!, stackTrace);
    });
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut().whenComplete(() {
      log.d("Signed out from Firebase.");
    });
  }
}
