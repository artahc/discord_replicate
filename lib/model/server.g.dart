// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServerAdapter extends TypeAdapter<Server> {
  @override
  final int typeId = 0;

  @override
  Server read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Server(
      id: fields[0] as String,
      name: fields[1] as String,
      imageUrl: fields[2] as String?,
      channels: (fields[3] as List).cast<Channel>(),
    );
  }

  @override
  void write(BinaryWriter writer, Server obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
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
