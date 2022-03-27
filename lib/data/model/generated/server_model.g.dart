// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../server_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerModel _$ServerModelFromJson(Map<String, dynamic> json) => ServerModel(
      json['id'] as String,
      json['name'] as String,
      json['imageUrl'] as String?,
      json['userGroupRef'] as String,
      (json['channels'] as List<dynamic>?)
              ?.map((e) => ChannelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ServerModelToJson(ServerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userGroupRef': instance.userGroupRef,
      'imageUrl': instance.imageUrl,
      'channels': instance.channels,
    };
