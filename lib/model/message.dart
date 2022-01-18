import 'dart:math';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  @HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
  factory Message({
    @HiveField(0) required String id,
    @HiveField(1) required String senderRef,
    @HiveField(2) @TimestampConverter() @JsonKey(name: 'timestamp') required DateTime date,
    @HiveField(3) required String message,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> map) => _$MessageFromJson(map);
}

class TimestampConverter implements JsonConverter<DateTime, int> {
  const TimestampConverter();

  @override
  DateTime fromJson(int ts) => DateTime.fromMillisecondsSinceEpoch(ts);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}
