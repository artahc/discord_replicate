// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

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
      sender: fields[1] as Member,
      date: fields[2] as DateTime,
      message: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Message obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sender)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.message);
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
      sender: Member.fromJson(json['sender'] as Map<String, dynamic>),
      date: const TimestampConverter().fromJson(json['timestamp'] as int),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'timestamp': const TimestampConverter().toJson(instance.date),
      'message': instance.message,
    };

_$_RawMessage _$$_RawMessageFromJson(Map<String, dynamic> json) =>
    _$_RawMessage(
      id: json['id'] as String,
      senderRef: json['senderRef'] as String,
      date: const TimestampConverter().fromJson(json['timestamp'] as int),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_RawMessageToJson(_$_RawMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderRef': instance.senderRef,
      'timestamp': const TimestampConverter().toJson(instance.date),
      'message': instance.message,
    };
