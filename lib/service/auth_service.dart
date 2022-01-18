import 'dart:async';
import 'dart:developer';
import 'package:discord_replicate/model/credential.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<Credential?> getCredential({bool forceRefresh = false});

  Future<Credential> signIn(String email, String password);

  Future<Credential> signUpEmail(String email);

  Future<void> signOut();
}

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

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
    log("Signin in to firebase...", name: this.runtimeType.toString());
    return _auth.signInWithEmailAndPassword(email: email, password: password).then((credential) async {
      var user = credential.user!;
      var token = await user.getIdToken(false);
      return Credential(uid: user.uid, email: user.email!, token: token);
    }).whenComplete(() {
      log("Signed in to firebase", name: this.runtimeType.toString());
    }).onError((error, stackTrace) {
      return Future.error(error!, stackTrace);
    });
  }

  @override
  Future<Credential> signUpEmail(String email) {
    return _auth.createUserWithEmailAndPassword(email: email, password: "password").then((credential) async {
      var user = credential.user!;
      var token = await user.getIdToken(false);
      return Credential(uid: user.uid, email: user.email!, token: token);
    }).onError((error, stackTrace) {
      return Future.error(error!, stackTrace);
    });
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut().whenComplete(() {
      log("Signed out from firebase", name: this.runtimeType.toString());
    });
  }
}
