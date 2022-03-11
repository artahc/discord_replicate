import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/common/hive_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part '__generated/message.freezed.dart';
part '__generated/message.g.dart';

@freezed
class Message with _$Message {
  const Message._();

  @HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
  const factory Message({
    @HiveField(0) required String id,
    @HiveField(1) required Member sender,
    @HiveField(2) @TimestampConverter() @JsonKey(name: 'timestamp') required DateTime date,
    @HiveField(3) required String message,
    @HiveField(4) @Default("Sent") String status,
  }) = _Message;

  String get contentHash {
    var encoded = utf8.encode("${sender.uid}${date.millisecondsSinceEpoch}$message");
    return md5.convert(encoded).toString();
  }

  factory Message.fromJson(Map<String, dynamic> map) => _Message.fromJson(map);
}

class PlaceholderMessage implements Message {
  @override
  String get contentHash => throw UnimplementedError();

  @override
  $MessageCopyWith<Message> get copyWith => throw UnimplementedError();

  @override
  DateTime get date => throw UnimplementedError();

  @override
  String get id => throw UnimplementedError();

  @override
  String get message => throw UnimplementedError();

  @override
  Member get sender => throw UnimplementedError();

  @override
  String get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

@freezed
class RawMessage with _$RawMessage {
  const factory RawMessage({
    required String id,
    required String senderRef,
    @TimestampConverter() @JsonKey(name: 'timestamp') required DateTime date,
    required String message,
  }) = _RawMessage;

  factory RawMessage.fromJson(Map<String, dynamic> map) => _RawMessage.fromJson(map);
}

class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int ts) => DateTime.fromMillisecondsSinceEpoch(ts);

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}
