// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      json['id'] as String,
      json['senderRef'] as String,
      json['message'] as String,
      json['timestamp'] as int,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderRef': instance.senderRef,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
