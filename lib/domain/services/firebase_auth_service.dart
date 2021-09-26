import 'dart:async';
import 'dart:developer' as dev;
import 'package:firebase_auth/firebase_auth.dart';

class UserCredential {
  final String idToken;

  UserCredential(this.idToken);
}

abstract class AuthService {
  Future<UserCredential?> getUserCurrentState();

  Future<UserCredential> signIn(String email, String password);

  Future<UserCredential> signUpEmail(String email);

  void signOut();
}

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  FirebaseAuthService() {
    _auth.userChanges().listen((event) {
      dev.log("Current user: $event", name: this.runtimeType.toString());
    });
  }

  @override
  Future<UserCredential?> getUserCurrentState() async {
    if (_auth.currentUser == null)
      return Future.value(null);
    else {
      var idToken = await _auth.currentUser!.getIdToken(false);
      return UserCredential(idToken);
    }
  }

  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password).then((credential) async {
      var idToken = await credential.user!.getIdToken(false);
      //dev.log("Token: $idToken", name: this.runtimeType.toString());
      return UserCredential(idToken);
    }).onError((error, stackTrace) {
      // dev.log("Error $error", name: this.runtimeType.toString());
      return Future.error(error!, stackTrace);
    });
  }

  @override
  Future<UserCredential> signUpEmail(String email) {
    return _auth.createUserWithEmailAndPassword(email: email, password: "password").then((credential) async {
      var idToken = await credential.user!.getIdToken(false);
      //dev.log("Token: $idToken", name: this.runtimeType.toString());
      return UserCredential(idToken);
    }).onError((error, stackTrace) {
      // dev.log("Error $error", name: this.runtimeType.toString(), stackTrace: stackTrace);
      return Future.error(error!, stackTrace);
    });
  }

  @override
  void signOut() async {
    await _auth.signOut();
  }
}
