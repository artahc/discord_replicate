// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserEventTearOff {
  const _$UserEventTearOff();

  UserEventLoadMe loadUser(String uid, {bool fromLocal = false}) {
    return UserEventLoadMe(
      uid,
      fromLocal: fromLocal,
    );
  }
}

/// @nodoc
const $UserEvent = _$UserEventTearOff();

/// @nodoc
mixin _$UserEvent {
  String get uid => throw _privateConstructorUsedError;
  bool get fromLocal => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, bool fromLocal) loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid, bool fromLocal)? loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, bool fromLocal)? loadUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadMe value) loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadMe value)? loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadMe value)? loadUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserEventCopyWith<UserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
  $Res call({String uid, bool fromLocal});
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? fromLocal = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fromLocal: fromLocal == freezed
          ? _value.fromLocal
          : fromLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class $UserEventLoadMeCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory $UserEventLoadMeCopyWith(
          UserEventLoadMe value, $Res Function(UserEventLoadMe) then) =
      _$UserEventLoadMeCopyWithImpl<$Res>;
  @override
  $Res call({String uid, bool fromLocal});
}

/// @nodoc
class _$UserEventLoadMeCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements $UserEventLoadMeCopyWith<$Res> {
  _$UserEventLoadMeCopyWithImpl(
      UserEventLoadMe _value, $Res Function(UserEventLoadMe) _then)
      : super(_value, (v) => _then(v as UserEventLoadMe));

  @override
  UserEventLoadMe get _value => super._value as UserEventLoadMe;

  @override
  $Res call({
    Object? uid = freezed,
    Object? fromLocal = freezed,
  }) {
    return _then(UserEventLoadMe(
      uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fromLocal: fromLocal == freezed
          ? _value.fromLocal
          : fromLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserEventLoadMe implements UserEventLoadMe {
  const _$UserEventLoadMe(this.uid, {this.fromLocal = false});

  @override
  final String uid;
  @JsonKey(defaultValue: false)
  @override
  final bool fromLocal;

  @override
  String toString() {
    return 'UserEvent.loadUser(uid: $uid, fromLocal: $fromLocal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserEventLoadMe &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.fromLocal, fromLocal) ||
                other.fromLocal == fromLocal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, fromLocal);

  @JsonKey(ignore: true)
  @override
  $UserEventLoadMeCopyWith<UserEventLoadMe> get copyWith =>
      _$UserEventLoadMeCopyWithImpl<UserEventLoadMe>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid, bool fromLocal) loadUser,
  }) {
    return loadUser(uid, fromLocal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid, bool fromLocal)? loadUser,
  }) {
    return loadUser?.call(uid, fromLocal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid, bool fromLocal)? loadUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(uid, fromLocal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadMe value) loadUser,
  }) {
    return loadUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadMe value)? loadUser,
  }) {
    return loadUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadMe value)? loadUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(this);
    }
    return orElse();
  }
}

abstract class UserEventLoadMe implements UserEvent {
  const factory UserEventLoadMe(String uid, {bool fromLocal}) =
      _$UserEventLoadMe;

  @override
  String get uid;
  @override
  bool get fromLocal;
  @override
  @JsonKey(ignore: true)
  $UserEventLoadMeCopyWith<UserEventLoadMe> get copyWith =>
      throw _privateConstructorUsedError;
}
