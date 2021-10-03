import 'package:flutter/material.dart';

enum UserStatus { Online, Idle, DoNotDisturb, Invisible, Custom }

@immutable
class UserData {
  final String name;
  final UserStatus status;

  UserData({required this.name, required this.status});

  @override
  String toString() {
    return "{name:$name, status:$status}";
  }
}
