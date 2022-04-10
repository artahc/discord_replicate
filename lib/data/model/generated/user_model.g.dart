// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['uid'] as String,
      json['name'] as String,
      json['about'] as String?,
      json['avatarUrl'] as String?,
      (json['servers'] as List<dynamic>?)
              ?.map((e) => ServerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['privateChannels'] as List<dynamic>?)
              ?.map((e) => ChannelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.id,
      'name': instance.name,
      'about': instance.about,
      'avatarUrl': instance.avatarUrl,
      'servers': instance.servers,
      'privateChannels': instance.privateChannels,
    };
