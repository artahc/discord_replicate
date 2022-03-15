// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) => ChannelModel(
      json['id'] as String,
      json['name'] as String,
      json['userGroupRef'] as String,
    );

Map<String, dynamic> _$ChannelModelToJson(ChannelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userGroupRef': instance.userGroupRef,
    };
