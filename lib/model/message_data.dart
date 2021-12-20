import 'dart:math';

import 'package:flutter/material.dart';

@immutable
class MessageData {
  final String id;
  final String userId;
  final String userName;
  final String avatarUrl;
  final String message;
  final DateTime createdAt;

  MessageData(
      {required this.id, required this.userId, required this.userName, required this.avatarUrl, required this.message, required this.createdAt});

  static MessageData createDummy() {
    return MessageData(
      id: "Dummy-Id" + Random().nextInt(100).toString(),
      avatarUrl: "url",
      createdAt: DateTime.now(),
      message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and "
          "scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into"
          " electronic typesetting, remaining essentially unchanged.",
      userId: "User Id",
      userName: "User Name",
    );
  }
}
