import 'package:json_annotation/json_annotation.dart';

part 'generated/message_model.g.dart';

@JsonSerializable()
class MessageModel {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "senderRef")
  final String senderRef;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "timestamp")
  final int timestamp;

  const MessageModel(this.id, this.senderRef, this.message, this.timestamp);

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
