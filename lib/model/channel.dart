import 'package:flutter/material.dart';

@immutable
class Channel {
  final String id;
  final String name;

  Channel({required this.id, required this.name});

  factory Channel.dummy() => Channel(id: "id", name: "name");

  factory Channel.fromJson(Map<String, dynamic> map) {
    return Channel(id: map['id'], name: map['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
