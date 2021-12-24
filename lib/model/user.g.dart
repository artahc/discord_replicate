// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserAdapter extends TypeAdapter<LocalUser> {
  @override
  final int typeId = 3;

  @override
  LocalUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUser(
      uid: fields[0] as String,
      username: fields[1] as String,
      about: fields[2] as String?,
      servers: (fields[5] as List).cast<Server>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalUser obj) {
    writer
      ..writeByte(4)
      ..writeByte(5)
      ..write(obj.servers)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RemoteUserAdapter extends TypeAdapter<RemoteUser> {
  @override
  final int typeId = 4;

  @override
  RemoteUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RemoteUser(
      uid: fields[0] as String,
      username: fields[1] as String,
      about: fields[2] as String?,
      servers: (fields[5] as List).cast<Server>(),
    );
  }

  @override
  void write(BinaryWriter writer, RemoteUser obj) {
    writer
      ..writeByte(4)
      ..writeByte(5)
      ..write(obj.servers)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemoteUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
