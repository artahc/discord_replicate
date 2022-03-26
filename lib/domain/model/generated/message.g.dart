// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageAdapter extends TypeAdapter<_$_Message> {
  @override
  final int typeId = 10;

  @override
  _$_Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Message(
      id: fields[0] as String,
      senderRef: fields[1] as String,
      date: fields[2] as DateTime,
      message: fields[3] as String,
      status: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Message obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.senderRef)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.message)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['id'] as String,
      senderRef: json['senderRef'] as String,
      date: DateTime.parse(json['date'] as String),
      message: json['message'] as String,
      status: json['status'] as String? ?? "Sent",
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderRef': instance.senderRef,
      'date': instance.date.toIso8601String(),
      'message': instance.message,
      'status': instance.status,
    };
