// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Server _$ServerFromJson(Map<String, dynamic> json) {
  return _Server.fromJson(json);
}

/// @nodoc
class _$ServerTearOff {
  const _$ServerTearOff();

  _Server call(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required String imageUrl,
      @HiveField(3) required String userGroupRef,
      @HiveField(4) List<Channel> channels = const <Channel>[]}) {
    return _Server(
      id: id,
      name: name,
      imageUrl: imageUrl,
      userGroupRef: userGroupRef,
      channels: channels,
    );
  }

  Server fromJson(Map<String, Object?> json) {
    return Server.fromJson(json);
  }
}

/// @nodoc
const $Server = _$ServerTearOff();

/// @nodoc
mixin _$Server {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  String get userGroupRef => throw _privateConstructorUsedError;
  @HiveField(4)
  List<Channel> get channels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerCopyWith<Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerCopyWith<$Res> {
  factory $ServerCopyWith(Server value, $Res Function(Server) then) =
      _$ServerCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String imageUrl,
      @HiveField(3) String userGroupRef,
      @HiveField(4) List<Channel> channels});
}

/// @nodoc
class _$ServerCopyWithImpl<$Res> implements $ServerCopyWith<$Res> {
  _$ServerCopyWithImpl(this._value, this._then);

  final Server _value;
  // ignore: unused_field
  final $Res Function(Server) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? userGroupRef = freezed,
    Object? channels = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupRef: userGroupRef == freezed
          ? _value.userGroupRef
          : userGroupRef // ignore: cast_nullable_to_non_nullable
              as String,
      channels: channels == freezed
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
    ));
  }
}

/// @nodoc
abstract class _$ServerCopyWith<$Res> implements $ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) then) =
      __$ServerCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String imageUrl,
      @HiveField(3) String userGroupRef,
      @HiveField(4) List<Channel> channels});
}

/// @nodoc
class __$ServerCopyWithImpl<$Res> extends _$ServerCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(_Server _value, $Res Function(_Server) _then)
      : super(_value, (v) => _then(v as _Server));

  @override
  _Server get _value => super._value as _Server;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? userGroupRef = freezed,
    Object? channels = freezed,
  }) {
    return _then(_Server(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupRef: userGroupRef == freezed
          ? _value.userGroupRef
          : userGroupRef // ignore: cast_nullable_to_non_nullable
              as String,
      channels: channels == freezed
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveConstants.SERVER_TYPE, adapterName: "ServerAdapter")
class _$_Server implements _Server {
  _$_Server(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.imageUrl,
      @HiveField(3) required this.userGroupRef,
      @HiveField(4) this.channels = const <Channel>[]});

  factory _$_Server.fromJson(Map<String, dynamic> json) =>
      _$$_ServerFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String imageUrl;
  @override
  @HiveField(3)
  final String userGroupRef;
  @JsonKey()
  @override
  @HiveField(4)
  final List<Channel> channels;

  @override
  String toString() {
    return 'Server(id: $id, name: $name, imageUrl: $imageUrl, userGroupRef: $userGroupRef, channels: $channels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Server &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.userGroupRef, userGroupRef) &&
            const DeepCollectionEquality().equals(other.channels, channels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(userGroupRef),
      const DeepCollectionEquality().hash(channels));

  @JsonKey(ignore: true)
  @override
  _$ServerCopyWith<_Server> get copyWith =>
      __$ServerCopyWithImpl<_Server>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServerToJson(this);
  }
}

abstract class _Server implements Server {
  factory _Server(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required String imageUrl,
      @HiveField(3) required String userGroupRef,
      @HiveField(4) List<Channel> channels}) = _$_Server;

  factory _Server.fromJson(Map<String, dynamic> json) = _$_Server.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get imageUrl;
  @override
  @HiveField(3)
  String get userGroupRef;
  @override
  @HiveField(4)
  List<Channel> get channels;
  @override
  @JsonKey(ignore: true)
  _$ServerCopyWith<_Server> get copyWith => throw _privateConstructorUsedError;
}
