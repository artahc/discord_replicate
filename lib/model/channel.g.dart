// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChannelAdapter extends TypeAdapter<_$_Channel> {
  @override
  final int typeId = 2;

  @override
  _$_Channel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Channel(
      id: fields[0] as String,
      name: fields[1] as String,
      userGroupRef: fields[2] as String,
      members: (fields[3] as List).cast<Member>(),
      messages: (fields[4] as List).cast<Message>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Channel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.userGroupRef)
      ..writeByte(3)
      ..write(obj.members)
      ..writeByte(4)
      ..write(obj.messages);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Channel _$$_ChannelFromJson(Map<String, dynamic> json) => _$_Channel(
      id: json['id'] as String,
      name: json['name'] as String,
      userGroupRef: json['userGroupRef'] as String,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Member>[],
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Message>[],
    );

Map<String, dynamic> _$$_ChannelToJson(_$_Channel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userGroupRef': instance.userGroupRef,
      'members': instance.members,
      'messages': instance.messages,
    };
