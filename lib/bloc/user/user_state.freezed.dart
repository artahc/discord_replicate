// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  UserStateInitial initial() {
    return const UserStateInitial();
  }

  UserStateUserLoaded userLoaded(User user) {
    return UserStateUserLoaded(
      user,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? userLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateUserLoaded value) userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateUserLoaded value)? userLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class $UserStateInitialCopyWith<$Res> {
  factory $UserStateInitialCopyWith(
          UserStateInitial value, $Res Function(UserStateInitial) then) =
      _$UserStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateInitialCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateInitialCopyWith<$Res> {
  _$UserStateInitialCopyWithImpl(
      UserStateInitial _value, $Res Function(UserStateInitial) _then)
      : super(_value, (v) => _then(v as UserStateInitial));

  @override
  UserStateInitial get _value => super._value as UserStateInitial;
}

/// @nodoc

class _$UserStateInitial implements UserStateInitial {
  const _$UserStateInitial();

  @override
  String toString() {
    return 'UserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) userLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? userLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? userLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateUserLoaded value) userLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateUserLoaded value)? userLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UserStateInitial implements UserState {
  const factory UserStateInitial() = _$UserStateInitial;
}

/// @nodoc
abstract class $UserStateUserLoadedCopyWith<$Res> {
  factory $UserStateUserLoadedCopyWith(
          UserStateUserLoaded value, $Res Function(UserStateUserLoaded) then) =
      _$UserStateUserLoadedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$UserStateUserLoadedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateUserLoadedCopyWith<$Res> {
  _$UserStateUserLoadedCopyWithImpl(
      UserStateUserLoaded _value, $Res Function(UserStateUserLoaded) _then)
      : super(_value, (v) => _then(v as UserStateUserLoaded));

  @override
  UserStateUserLoaded get _value => super._value as UserStateUserLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UserStateUserLoaded(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$UserStateUserLoaded implements UserStateUserLoaded {
  const _$UserStateUserLoaded(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.userLoaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateUserLoaded &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  $UserStateUserLoadedCopyWith<UserStateUserLoaded> get copyWith =>
      _$UserStateUserLoadedCopyWithImpl<UserStateUserLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) userLoaded,
  }) {
    return userLoaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? userLoaded,
  }) {
    return userLoaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? userLoaded,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateUserLoaded value) userLoaded,
  }) {
    return userLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateUserLoaded value)? userLoaded,
  }) {
    return userLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateUserLoaded value)? userLoaded,
    required TResult orElse(),
  }) {
    if (userLoaded != null) {
      return userLoaded(this);
    }
    return orElse();
  }
}

abstract class UserStateUserLoaded implements UserState {
  const factory UserStateUserLoaded(User user) = _$UserStateUserLoaded;

  User get user;
  @JsonKey(ignore: true)
  $UserStateUserLoadedCopyWith<UserStateUserLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
