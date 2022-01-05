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

  UserEventLoadUser loadUser(String uid) {
    return UserEventLoadUser(
      uid,
    );
  }

  UserEventLoadLocalUser loadLocalUser() {
    return const UserEventLoadLocalUser();
  }
}

/// @nodoc
const $UserEvent = _$UserEventTearOff();

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadUser,
    required TResult Function() loadLocalUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? loadUser,
    TResult Function()? loadLocalUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadUser,
    TResult Function()? loadLocalUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadUser value) loadUser,
    required TResult Function(UserEventLoadLocalUser value) loadLocalUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadUser value)? loadUser,
    TResult Function(UserEventLoadLocalUser value)? loadLocalUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadUser value)? loadUser,
    TResult Function(UserEventLoadLocalUser value)? loadLocalUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;
}

/// @nodoc
abstract class $UserEventLoadUserCopyWith<$Res> {
  factory $UserEventLoadUserCopyWith(
          UserEventLoadUser value, $Res Function(UserEventLoadUser) then) =
      _$UserEventLoadUserCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class _$UserEventLoadUserCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements $UserEventLoadUserCopyWith<$Res> {
  _$UserEventLoadUserCopyWithImpl(
      UserEventLoadUser _value, $Res Function(UserEventLoadUser) _then)
      : super(_value, (v) => _then(v as UserEventLoadUser));

  @override
  UserEventLoadUser get _value => super._value as UserEventLoadUser;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(UserEventLoadUser(
      uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserEventLoadUser implements UserEventLoadUser {
  const _$UserEventLoadUser(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'UserEvent.loadUser(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserEventLoadUser &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  $UserEventLoadUserCopyWith<UserEventLoadUser> get copyWith =>
      _$UserEventLoadUserCopyWithImpl<UserEventLoadUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadUser,
    required TResult Function() loadLocalUser,
  }) {
    return loadUser(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? loadUser,
    TResult Function()? loadLocalUser,
  }) {
    return loadUser?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadUser,
    TResult Function()? loadLocalUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadUser value) loadUser,
    required TResult Function(UserEventLoadLocalUser value) loadLocalUser,
  }) {
    return loadUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadUser value)? loadUser,
    TResult Function(UserEventLoadLocalUser value)? loadLocalUser,
  }) {
    return loadUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadUser value)? loadUser,
    TResult Function(UserEventLoadLocalUser value)? loadLocalUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(this);
    }
    return orElse();
  }
}

abstract class UserEventLoadUser implements UserEvent {
  const factory UserEventLoadUser(String uid) = _$UserEventLoadUser;

  String get uid;
  @JsonKey(ignore: true)
  $UserEventLoadUserCopyWith<UserEventLoadUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventLoadLocalUserCopyWith<$Res> {
  factory $UserEventLoadLocalUserCopyWith(UserEventLoadLocalUser value,
          $Res Function(UserEventLoadLocalUser) then) =
      _$UserEventLoadLocalUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventLoadLocalUserCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements $UserEventLoadLocalUserCopyWith<$Res> {
  _$UserEventLoadLocalUserCopyWithImpl(UserEventLoadLocalUser _value,
      $Res Function(UserEventLoadLocalUser) _then)
      : super(_value, (v) => _then(v as UserEventLoadLocalUser));

  @override
  UserEventLoadLocalUser get _value => super._value as UserEventLoadLocalUser;
}

/// @nodoc

class _$UserEventLoadLocalUser implements UserEventLoadLocalUser {
  const _$UserEventLoadLocalUser();

  @override
  String toString() {
    return 'UserEvent.loadLocalUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserEventLoadLocalUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) loadUser,
    required TResult Function() loadLocalUser,
  }) {
    return loadLocalUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? loadUser,
    TResult Function()? loadLocalUser,
  }) {
    return loadLocalUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? loadUser,
    TResult Function()? loadLocalUser,
    required TResult orElse(),
  }) {
    if (loadLocalUser != null) {
      return loadLocalUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadUser value) loadUser,
    required TResult Function(UserEventLoadLocalUser value) loadLocalUser,
  }) {
    return loadLocalUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadUser value)? loadUser,
    TResult Function(UserEventLoadLocalUser value)? loadLocalUser,
  }) {
    return loadLocalUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadUser value)? loadUser,
    TResult Function(UserEventLoadLocalUser value)? loadLocalUser,
    required TResult orElse(),
  }) {
    if (loadLocalUser != null) {
      return loadLocalUser(this);
    }
    return orElse();
  }
}

abstract class UserEventLoadLocalUser implements UserEvent {
  const factory UserEventLoadLocalUser() = _$UserEventLoadLocalUser;
}
