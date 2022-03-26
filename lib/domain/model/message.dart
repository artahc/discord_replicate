import 'dart:convert';

import 'package:discord_replicate/data/constants/hive_constants.dart';
import 'package:discord_replicate/domain/model/member.dart';

import 'package:crypto/crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'generated/message.freezed.dart';
part 'generated/message.g.dart';

@freezed
class Message with _$Message {
  const Message._();

  @HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
  const factory Message({
    @HiveField(0) required String id,
    @HiveField(1) required String senderRef,
    @HiveField(2) required DateTime date,
    @HiveField(3) required String message,
    @HiveField(4) @Default("Sent") String status,
  }) = _Message;

  factory Message.pending({
    required String senderRef,
    required DateTime date,
    required String message,
  }) =>
      Message(
        id: "random_generated_id",
        senderRef: senderRef,
        date: date,
        message: message,
        status: "Pending",
      );

  String get contentHash {
    var encoded = utf8.encode("${senderRef}${date.millisecondsSinceEpoch}$message");
    return md5.convert(encoded).toString();
  }

  factory Message.fromJson(Map<String, dynamic> map) => _Message.fromJson(map);
}

