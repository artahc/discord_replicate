// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@HiveField(0) required String uid,
      @HiveField(1) required String name,
      @HiveField(2) required String? avatarUrl,
      @HiveField(3) required String? about,
      @HiveField(4) List<Server> servers = const <Server>[],
      @HiveField(5) List<Channel> privateChannels = const <Channel>[]}) {
    return _User(
      uid: uid,
      name: name,
      avatarUrl: avatarUrl,
      about: about,
      servers: servers,
      privateChannels: privateChannels,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @HiveField(0)
  String get uid => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get avatarUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get about => throw _privateConstructorUsedError;
  @HiveField(4)
  List<Server> get servers => throw _privateConstructorUsedError;
  @HiveField(5)
  List<Channel> get privateChannels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String name,
      @HiveField(2) String? avatarUrl,
      @HiveField(3) String? about,
      @HiveField(4) List<Server> servers,
      @HiveField(5) List<Channel> privateChannels});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? about = freezed,
    Object? servers = freezed,
    Object? privateChannels = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      servers: servers == freezed
          ? _value.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      privateChannels: privateChannels == freezed
          ? _value.privateChannels
          : privateChannels // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String uid,
      @HiveField(1) String name,
      @HiveField(2) String? avatarUrl,
      @HiveField(3) String? about,
      @HiveField(4) List<Server> servers,
      @HiveField(5) List<Channel> privateChannels});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? about = freezed,
    Object? servers = freezed,
    Object? privateChannels = freezed,
  }) {
    return _then(_User(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: avatarUrl == freezed
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: about == freezed
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      servers: servers == freezed
          ? _value.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
      privateChannels: privateChannels == freezed
          ? _value.privateChannels
          : privateChannels // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveConstants.USER_TYPE, adapterName: "UserAdapter")
class _$_User implements _User {
  _$_User(
      {@HiveField(0) required this.uid,
      @HiveField(1) required this.name,
      @HiveField(2) required this.avatarUrl,
      @HiveField(3) required this.about,
      @HiveField(4) this.servers = const <Server>[],
      @HiveField(5) this.privateChannels = const <Channel>[]});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @HiveField(0)
  final String uid;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? avatarUrl;
  @override
  @HiveField(3)
  final String? about;
  @JsonKey()
  @override
  @HiveField(4)
  final List<Server> servers;
  @JsonKey()
  @override
  @HiveField(5)
  final List<Channel> privateChannels;

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, avatarUrl: $avatarUrl, about: $about, servers: $servers, privateChannels: $privateChannels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatarUrl, avatarUrl) &&
            const DeepCollectionEquality().equals(other.about, about) &&
            const DeepCollectionEquality().equals(other.servers, servers) &&
            const DeepCollectionEquality()
                .equals(other.privateChannels, privateChannels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatarUrl),
      const DeepCollectionEquality().hash(about),
      const DeepCollectionEquality().hash(servers),
      const DeepCollectionEquality().hash(privateChannels));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {@HiveField(0) required String uid,
      @HiveField(1) required String name,
      @HiveField(2) required String? avatarUrl,
      @HiveField(3) required String? about,
      @HiveField(4) List<Server> servers,
      @HiveField(5) List<Channel> privateChannels}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @HiveField(0)
  String get uid;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String? get avatarUrl;
  @override
  @HiveField(3)
  String? get about;
  @override
  @HiveField(4)
  List<Server> get servers;
  @override
  @HiveField(5)
  List<Channel> get privateChannels;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
