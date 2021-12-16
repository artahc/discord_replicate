import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'dart:developer';

enum UserStatus { Online, Idle, DoNotDisturb, Invisible, Custom }

extension ParseToString on UserStatus {
  String value() {
    return this.toString().split('.').last;
  }
}

@immutable
class User {
  final String id;
  final String username;
  final List<String> serverRefs;

  User({required this.id, required this.username, this.serverRefs = const <String>[]});

  factory User.fromJson(Map<String, dynamic> map) {
    var serverRefs = (map['serverRefs'] as List<Object?>).map((e) => e as String).toList();
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      serverRefs: serverRefs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "serverRefs": serverRefs,
    };
  }

  factory User.dummy() {
    var random = math.Random().nextInt(15);
    return User(
      id: "id+$random",
      username: "username+$random",
      serverRefs: List.generate(random, (index) => "server-$index"),
    );
  }
}
