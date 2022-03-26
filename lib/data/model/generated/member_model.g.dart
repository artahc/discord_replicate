// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      json['uid'] as String,
      json['name'] as String,
      json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'uid': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
    };
