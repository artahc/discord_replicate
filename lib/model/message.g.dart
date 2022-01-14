// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextMessageAdapter extends TypeAdapter<TextMessage> {
  @override
  final int typeId = 10;

  @override
  TextMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextMessage(
      id: fields[0] as String,
      senderId: fields[1] as String,
      date: fields[2] as DateTime,
      message: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TextMessage obj) {
    writer
      ..writeByte(4)
      ..writeByte(4)
      ..write(obj.message)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.senderId)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
