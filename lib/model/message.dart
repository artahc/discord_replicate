import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const Message._();

  @HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
  const factory Message({
    @HiveField(0) required String id,
    @HiveField(1) required User sender,
    @HiveField(2) @TimestampConverter() @JsonKey(name: 'timestamp') required DateTime date,
    @HiveField(3) required String message,
  }) = _Message;

  const factory Message.raw({required String id, required String senderRef, required int timestamp, required String message}) = RawMessage;

  factory Message.fromJson(Map<String, dynamic> map) => RawMessage.fromJson(map);

  String get id {
    return this.when(
      (id, sender, date, message) => id,
      raw: (id, senderRef, timestamp, message) => id,
    );
  }

  String get senderRef {
    return this.when(
      (id, sender, date, message) => sender.uid,
      raw: (id, senderRef, timestamp, message) => senderRef,
    );
  }

  User get user {
    return this.when(
      (id, sender, date, message) => sender,
      raw: (id, senderRef, timestamp, message) => throw Exception("Trying access user from raw message. Please construct into Message Model."),
    );
  }

  DateTime get date {
    return this.when(
      (id, sender, date, message) => date,
      raw: (id, senderRef, timestamp, message) => DateTime.fromMillisecondsSinceEpoch(timestamp),
    );
  }

  String get message {
    return this.when(
      (id, sender, date, message) => message,
      raw: (id, senderRef, timestamp, message) => message,
    );
  }

  String get contentHash {
    var encoded = this.when(
      (id, sender, date, message) => utf8.encode("${sender.uid}${date.millisecondsSinceEpoch}$message"),
      raw: (id, senderRef, timestamp, message) => utf8.encode("$senderRef$timestamp$message"),
    );
    return md5.convert(encoded).toString();
  }
}

class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int ts) => DateTime.fromMillisecondsSinceEpoch(ts);

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}
