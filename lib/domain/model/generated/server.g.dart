// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../server.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServerAdapter extends TypeAdapter<_$_Server> {
  @override
  final int typeId = 0;

  @override
  _$_Server read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Server(
      id: fields[0] as String,
      name: fields[1] as String,
      imageUrl: fields[2] as String?,
      userGroupRef: fields[3] as String,
      channels: (fields[4] as List).cast<Channel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Server obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.userGroupRef)
      ..writeByte(4)
      ..write(obj.channels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
