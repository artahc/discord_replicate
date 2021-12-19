// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChannelAdapter extends TypeAdapter<Channel> {
  @override
  final int typeId = 3;

  @override
  Channel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Channel(
      id: fields[0] as String,
      name: fields[1] as String,
      roomId: fields[2] as String,
      access: fields[3] as ChannelAccess,
    );
  }

  @override
  void write(BinaryWriter writer, Channel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.roomId)
      ..writeByte(3)
      ..write(obj.access);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChannelAccessAdapter extends TypeAdapter<ChannelAccess> {
  @override
  final int typeId = 4;

  @override
  ChannelAccess read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChannelAccess.PUBLIC;
      case 1:
        return ChannelAccess.PRIVATE;
      default:
        return ChannelAccess.PUBLIC;
    }
  }

  @override
  void write(BinaryWriter writer, ChannelAccess obj) {
    switch (obj) {
      case ChannelAccess.PUBLIC:
        writer.writeByte(0);
        break;
      case ChannelAccess.PRIVATE:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelAccessAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
