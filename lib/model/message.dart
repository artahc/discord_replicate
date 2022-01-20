import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const Message._();

  String get contentHash => md5.convert(utf8.encode("$senderRef$message${date.millisecondsSinceEpoch}")).toString();

  @HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
  const factory Message({
    @HiveField(0) required String id,
    @HiveField(1) required String senderRef,
    @HiveField(2) @TimestampConverter() @JsonKey(name: 'timestamp') required DateTime date,
    @HiveField(3) required String message,
  }) = _Message;

  const factory Message.pending({required String senderRef, required String message, required DateTime date}) = _PendingMessage;

  factory Message.fromJson(Map<String, dynamic> map) => _Message.fromJson(map);
}

class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int ts) => DateTime.fromMillisecondsSinceEpoch(ts);

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}
