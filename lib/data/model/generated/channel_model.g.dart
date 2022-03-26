// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) => ChannelModel(
      json['id'] as String,
      json['name'] as String,
      json['userGroupRef'] as String,
      (json['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['members'] as List<dynamic>)
          .map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelModelToJson(ChannelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userGroupRef': instance.userGroupRef,
      'messages': instance.messages,
      'members': instance.members,
    };
