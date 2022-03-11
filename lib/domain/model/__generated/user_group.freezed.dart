// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../user_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserGroupTearOff {
  const _$UserGroupTearOff();

  _UserGroup call(
      {@HiveField(0) required String id,
      @HiveField(1) Map<String, Member> members = const {}}) {
    return _UserGroup(
      id: id,
      members: members,
    );
  }
}

/// @nodoc
const $UserGroup = _$UserGroupTearOff();

/// @nodoc
mixin _$UserGroup {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  Map<String, Member> get members => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserGroupCopyWith<UserGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGroupCopyWith<$Res> {
  factory $UserGroupCopyWith(UserGroup value, $Res Function(UserGroup) then) =
      _$UserGroupCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id, @HiveField(1) Map<String, Member> members});
}

/// @nodoc
class _$UserGroupCopyWithImpl<$Res> implements $UserGroupCopyWith<$Res> {
  _$UserGroupCopyWithImpl(this._value, this._then);

  final UserGroup _value;
  // ignore: unused_field
  final $Res Function(UserGroup) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, Member>,
    ));
  }
}

/// @nodoc
abstract class _$UserGroupCopyWith<$Res> implements $UserGroupCopyWith<$Res> {
  factory _$UserGroupCopyWith(
          _UserGroup value, $Res Function(_UserGroup) then) =
      __$UserGroupCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id, @HiveField(1) Map<String, Member> members});
}

/// @nodoc
class __$UserGroupCopyWithImpl<$Res> extends _$UserGroupCopyWithImpl<$Res>
    implements _$UserGroupCopyWith<$Res> {
  __$UserGroupCopyWithImpl(_UserGroup _value, $Res Function(_UserGroup) _then)
      : super(_value, (v) => _then(v as _UserGroup));

  @override
  _UserGroup get _value => super._value as _UserGroup;

  @override
  $Res call({
    Object? id = freezed,
    Object? members = freezed,
  }) {
    return _then(_UserGroup(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: members == freezed
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, Member>,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: HiveConstants.USER_GROUP_TYPE, adapterName: "UserGroupAdapter")
class _$_UserGroup implements _UserGroup {
  const _$_UserGroup(
      {@HiveField(0) required this.id, @HiveField(1) this.members = const {}});

  @override
  @HiveField(0)
  final String id;
  @JsonKey()
  @override
  @HiveField(1)
  final Map<String, Member> members;

  @override
  String toString() {
    return 'UserGroup(id: $id, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserGroup &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.members, members));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(members));

  @JsonKey(ignore: true)
  @override
  _$UserGroupCopyWith<_UserGroup> get copyWith =>
      __$UserGroupCopyWithImpl<_UserGroup>(this, _$identity);
}

abstract class _UserGroup implements UserGroup {
  const factory _UserGroup(
      {@HiveField(0) required String id,
      @HiveField(1) Map<String, Member> members}) = _$_UserGroup;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  Map<String, Member> get members;
  @override
  @JsonKey(ignore: true)
  _$UserGroupCopyWith<_UserGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
