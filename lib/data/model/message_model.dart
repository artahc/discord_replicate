import 'package:json_annotation/json_annotation.dart';

part 'generated/message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String id;
  final String senderRef;
  final String message;
  final int timestamp;

  MessageModel(this.id, this.senderRef, this.message, this.timestamp);

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
