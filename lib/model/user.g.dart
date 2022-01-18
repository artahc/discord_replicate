// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<_$_User> {
  @override
  final int typeId = 1;

  @override
  _$_User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_User(
      uid: fields[0] as String,
      name: fields[1] as String,
      avatarUrl: fields[2] as String?,
      about: fields[3] as String?,
      servers: (fields[4] as List).cast<Server>(),
      privateChannels: (fields[5] as List).cast<Channel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_User obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.about)
      ..writeByte(4)
      ..write(obj.servers)
      ..writeByte(5)
      ..write(obj.privateChannels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uid: json['uid'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      about: json['about'] as String?,
      servers: (json['servers'] as List<dynamic>?)
              ?.map((e) => Server.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Server>[],
      privateChannels: (json['privateChannels'] as List<dynamic>?)
              ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Channel>[],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'about': instance.about,
      'servers': instance.servers,
      'privateChannels': instance.privateChannels,
    };
