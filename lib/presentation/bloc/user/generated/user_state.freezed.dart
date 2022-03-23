// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  UserStateEmpty empty() {
    return const UserStateEmpty();
  }

  UserStateLoadLoading loading() {
    return const UserStateLoadLoading();
  }

  UserStateLoaded loaded(User user) {
    return UserStateLoaded(
      user,
    );
  }

  UserStateLoadUserError error(Exception e) {
    return UserStateLoadUserError(
      e,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(Exception e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateEmpty value) empty,
    required TResult Function(UserStateLoadLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateLoadUserError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
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
abstract class $UserStateEmptyCopyWith<$Res> {
  factory $UserStateEmptyCopyWith(
          UserStateEmpty value, $Res Function(UserStateEmpty) then) =
      _$UserStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateEmptyCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateEmptyCopyWith<$Res> {
  _$UserStateEmptyCopyWithImpl(
      UserStateEmpty _value, $Res Function(UserStateEmpty) _then)
      : super(_value, (v) => _then(v as UserStateEmpty));

  @override
  UserStateEmpty get _value => super._value as UserStateEmpty;
}

/// @nodoc

class _$UserStateEmpty implements UserStateEmpty {
  const _$UserStateEmpty();

  @override
  String toString() {
    return 'UserState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(Exception e) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateEmpty value) empty,
    required TResult Function(UserStateLoadLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateLoadUserError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class UserStateEmpty implements UserState {
  const factory UserStateEmpty() = _$UserStateEmpty;
}

/// @nodoc
abstract class $UserStateLoadLoadingCopyWith<$Res> {
  factory $UserStateLoadLoadingCopyWith(UserStateLoadLoading value,
          $Res Function(UserStateLoadLoading) then) =
      _$UserStateLoadLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateLoadLoadingCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadLoadingCopyWith<$Res> {
  _$UserStateLoadLoadingCopyWithImpl(
      UserStateLoadLoading _value, $Res Function(UserStateLoadLoading) _then)
      : super(_value, (v) => _then(v as UserStateLoadLoading));

  @override
  UserStateLoadLoading get _value => super._value as UserStateLoadLoading;
}

/// @nodoc

class _$UserStateLoadLoading implements UserStateLoadLoading {
  const _$UserStateLoadLoading();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserStateLoadLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(Exception e) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateEmpty value) empty,
    required TResult Function(UserStateLoadLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateLoadUserError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadLoading implements UserState {
  const factory UserStateLoadLoading() = _$UserStateLoadLoading;
}

/// @nodoc
abstract class $UserStateLoadedCopyWith<$Res> {
  factory $UserStateLoadedCopyWith(
          UserStateLoaded value, $Res Function(UserStateLoaded) then) =
      _$UserStateLoadedCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserStateLoadedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadedCopyWith<$Res> {
  _$UserStateLoadedCopyWithImpl(
      UserStateLoaded _value, $Res Function(UserStateLoaded) _then)
      : super(_value, (v) => _then(v as UserStateLoaded));

  @override
  UserStateLoaded get _value => super._value as UserStateLoaded;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UserStateLoaded(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserStateLoaded implements UserStateLoaded {
  const _$UserStateLoaded(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.loaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoaded &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $UserStateLoadedCopyWith<UserStateLoaded> get copyWith =>
      _$UserStateLoadedCopyWithImpl<UserStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(Exception e) error,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateEmpty value) empty,
    required TResult Function(UserStateLoadLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateLoadUserError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserStateLoaded implements UserState {
  const factory UserStateLoaded(User user) = _$UserStateLoaded;

  User get user;
  @JsonKey(ignore: true)
  $UserStateLoadedCopyWith<UserStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateLoadUserErrorCopyWith<$Res> {
  factory $UserStateLoadUserErrorCopyWith(UserStateLoadUserError value,
          $Res Function(UserStateLoadUserError) then) =
      _$UserStateLoadUserErrorCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class _$UserStateLoadUserErrorCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadUserErrorCopyWith<$Res> {
  _$UserStateLoadUserErrorCopyWithImpl(UserStateLoadUserError _value,
      $Res Function(UserStateLoadUserError) _then)
      : super(_value, (v) => _then(v as UserStateLoadUserError));

  @override
  UserStateLoadUserError get _value => super._value as UserStateLoadUserError;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(UserStateLoadUserError(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$UserStateLoadUserError implements UserStateLoadUserError {
  const _$UserStateLoadUserError(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'UserState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoadUserError &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  $UserStateLoadUserErrorCopyWith<UserStateLoadUserError> get copyWith =>
      _$UserStateLoadUserErrorCopyWithImpl<UserStateLoadUserError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(Exception e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(Exception e)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateEmpty value) empty,
    required TResult Function(UserStateLoadLoading value) loading,
    required TResult Function(UserStateLoaded value) loaded,
    required TResult Function(UserStateLoadUserError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateEmpty value)? empty,
    TResult Function(UserStateLoadLoading value)? loading,
    TResult Function(UserStateLoaded value)? loaded,
    TResult Function(UserStateLoadUserError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadUserError implements UserState {
  const factory UserStateLoadUserError(Exception e) = _$UserStateLoadUserError;

  Exception get e;
  @JsonKey(ignore: true)
  $UserStateLoadUserErrorCopyWith<UserStateLoadUserError> get copyWith =>
      throw _privateConstructorUsedError;
}
