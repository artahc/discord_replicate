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

  UserEventLoadLocalUser loadUser() {
    return const UserEventLoadLocalUser();
  }

  UserEventDeleteLocalUser deleteUser() {
    return const UserEventDeleteLocalUser();
  }
}

/// @nodoc
const $UserEvent = _$UserEventTearOff();

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUser,
    required TResult Function() deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadUser,
    TResult Function()? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUser,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadLocalUser value) loadUser,
    required TResult Function(UserEventDeleteLocalUser value) deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadLocalUser value)? loadUser,
    TResult Function(UserEventDeleteLocalUser value)? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadLocalUser value)? loadUser,
    TResult Function(UserEventDeleteLocalUser value)? deleteUser,
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
    return 'UserEvent.loadUser()';
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
    required TResult Function() loadUser,
    required TResult Function() deleteUser,
  }) {
    return loadUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadUser,
    TResult Function()? deleteUser,
  }) {
    return loadUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUser,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadLocalUser value) loadUser,
    required TResult Function(UserEventDeleteLocalUser value) deleteUser,
  }) {
    return loadUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadLocalUser value)? loadUser,
    TResult Function(UserEventDeleteLocalUser value)? deleteUser,
  }) {
    return loadUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadLocalUser value)? loadUser,
    TResult Function(UserEventDeleteLocalUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(this);
    }
    return orElse();
  }
}

abstract class UserEventLoadLocalUser implements UserEvent {
  const factory UserEventLoadLocalUser() = _$UserEventLoadLocalUser;
}

/// @nodoc
abstract class $UserEventDeleteLocalUserCopyWith<$Res> {
  factory $UserEventDeleteLocalUserCopyWith(UserEventDeleteLocalUser value,
          $Res Function(UserEventDeleteLocalUser) then) =
      _$UserEventDeleteLocalUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventDeleteLocalUserCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res>
    implements $UserEventDeleteLocalUserCopyWith<$Res> {
  _$UserEventDeleteLocalUserCopyWithImpl(UserEventDeleteLocalUser _value,
      $Res Function(UserEventDeleteLocalUser) _then)
      : super(_value, (v) => _then(v as UserEventDeleteLocalUser));

  @override
  UserEventDeleteLocalUser get _value =>
      super._value as UserEventDeleteLocalUser;
}

/// @nodoc

class _$UserEventDeleteLocalUser implements UserEventDeleteLocalUser {
  const _$UserEventDeleteLocalUser();

  @override
  String toString() {
    return 'UserEvent.deleteUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserEventDeleteLocalUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUser,
    required TResult Function() deleteUser,
  }) {
    return deleteUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadUser,
    TResult Function()? deleteUser,
  }) {
    return deleteUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUser,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEventLoadLocalUser value) loadUser,
    required TResult Function(UserEventDeleteLocalUser value) deleteUser,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserEventLoadLocalUser value)? loadUser,
    TResult Function(UserEventDeleteLocalUser value)? deleteUser,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEventLoadLocalUser value)? loadUser,
    TResult Function(UserEventDeleteLocalUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class UserEventDeleteLocalUser implements UserEvent {
  const factory UserEventDeleteLocalUser() = _$UserEventDeleteLocalUser;
}
