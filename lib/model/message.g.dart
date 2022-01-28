// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageAdapter extends TypeAdapter<_$RawMessage> {
  @override
  final int typeId = 10;

  @override
  _$RawMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$RawMessage(
      id: fields[0] as String,
      senderRef: fields[1] as String,
      timestamp: fields[2] as int,
      message: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$RawMessage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.senderRef)
      ..writeByte(2)
      ..write(obj.timestamp)
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

_$MessageWithMember _$$MessageWithMemberFromJson(Map<String, dynamic> json) =>
    _$MessageWithMember(
      id: json['id'] as String,
      sender: Member.fromJson(json['sender'] as Map<String, dynamic>),
      date: const TimestampConverter().fromJson(json['timestamp'] as int),
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MessageWithMemberToJson(_$MessageWithMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'timestamp': const TimestampConverter().toJson(instance.date),
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$PendingMessage _$$PendingMessageFromJson(Map<String, dynamic> json) =>
    _$PendingMessage(
      sender: Member.fromJson(json['sender'] as Map<String, dynamic>),
      date: const TimestampConverter().fromJson(json['timestamp'] as int),
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PendingMessageToJson(_$PendingMessage instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'timestamp': const TimestampConverter().toJson(instance.date),
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$RawMessage _$$RawMessageFromJson(Map<String, dynamic> json) => _$RawMessage(
      id: json['id'] as String,
      senderRef: json['senderRef'] as String,
      timestamp: json['timestamp'] as int,
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RawMessageToJson(_$RawMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderRef': instance.senderRef,
      'timestamp': instance.timestamp,
      'message': instance.message,
      'runtimeType': instance.$type,
    };
