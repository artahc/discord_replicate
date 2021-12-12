import 'package:flutter/cupertino.dart';

@immutable
class Credential {
  final String uid;
  final String email;
  final String token;

  Credential({required this.uid, required this.email, required this.token});
}
