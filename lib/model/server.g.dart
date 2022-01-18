// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

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
      imageUrl: fields[2] as String,
      channels: (fields[3] as List).cast<Channel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Server obj) {
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Server _$$_ServerFromJson(Map<String, dynamic> json) => _$_Server(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      channels: (json['channels'] as List<dynamic>?)
              ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Channel>[],
    );

Map<String, dynamic> _$$_ServerToJson(_$_Server instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'channels': instance.channels,
    };
