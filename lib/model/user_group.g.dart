// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGroupAdapter extends TypeAdapter<_$_UserGroup> {
  @override
  final int typeId = 4;

  @override
  _$_UserGroup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_UserGroup(
      id: fields[0] as String,
      members: (fields[1] as Map).cast<String, Member>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserGroup obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.members);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
