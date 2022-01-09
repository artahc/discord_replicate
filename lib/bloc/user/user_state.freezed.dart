// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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

  UserStateLoadLocalUserInProgress loadUserInProgress() {
    return const UserStateLoadLocalUserInProgress();
  }

  UserStateLoadLocalUserSuccess loadUserSuccess(User user) {
    return UserStateLoadLocalUserSuccess(
      user,
    );
  }

  UserStateLoadLocalUserFailed loadUserFailed() {
    return const UserStateLoadLocalUserFailed();
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadUserInProgress,
    required TResult Function(User user) loadUserSuccess,
    required TResult Function() loadUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
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
    required TResult Function() loadUserInProgress,
    required TResult Function(User user) loadUserSuccess,
    required TResult Function() loadUserFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
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
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadUserFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
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
abstract class $UserStateLoadLocalUserInProgressCopyWith<$Res> {
  factory $UserStateLoadLocalUserInProgressCopyWith(
          UserStateLoadLocalUserInProgress value,
          $Res Function(UserStateLoadLocalUserInProgress) then) =
      _$UserStateLoadLocalUserInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateLoadLocalUserInProgressCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadLocalUserInProgressCopyWith<$Res> {
  _$UserStateLoadLocalUserInProgressCopyWithImpl(
      UserStateLoadLocalUserInProgress _value,
      $Res Function(UserStateLoadLocalUserInProgress) _then)
      : super(_value, (v) => _then(v as UserStateLoadLocalUserInProgress));

  @override
  UserStateLoadLocalUserInProgress get _value =>
      super._value as UserStateLoadLocalUserInProgress;
}

/// @nodoc

class _$UserStateLoadLocalUserInProgress
    implements UserStateLoadLocalUserInProgress {
  const _$UserStateLoadLocalUserInProgress();

  @override
  String toString() {
    return 'UserState.loadUserInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoadLocalUserInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadUserInProgress,
    required TResult Function(User user) loadUserSuccess,
    required TResult Function() loadUserFailed,
  }) {
    return loadUserInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
  }) {
    return loadUserInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
    required TResult orElse(),
  }) {
    if (loadUserInProgress != null) {
      return loadUserInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadUserFailed,
  }) {
    return loadUserInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
  }) {
    return loadUserInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
    required TResult orElse(),
  }) {
    if (loadUserInProgress != null) {
      return loadUserInProgress(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadLocalUserInProgress implements UserState {
  const factory UserStateLoadLocalUserInProgress() =
      _$UserStateLoadLocalUserInProgress;
}

/// @nodoc
abstract class $UserStateLoadLocalUserSuccessCopyWith<$Res> {
  factory $UserStateLoadLocalUserSuccessCopyWith(
          UserStateLoadLocalUserSuccess value,
          $Res Function(UserStateLoadLocalUserSuccess) then) =
      _$UserStateLoadLocalUserSuccessCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$UserStateLoadLocalUserSuccessCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadLocalUserSuccessCopyWith<$Res> {
  _$UserStateLoadLocalUserSuccessCopyWithImpl(
      UserStateLoadLocalUserSuccess _value,
      $Res Function(UserStateLoadLocalUserSuccess) _then)
      : super(_value, (v) => _then(v as UserStateLoadLocalUserSuccess));

  @override
  UserStateLoadLocalUserSuccess get _value =>
      super._value as UserStateLoadLocalUserSuccess;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UserStateLoadLocalUserSuccess(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$UserStateLoadLocalUserSuccess implements UserStateLoadLocalUserSuccess {
  const _$UserStateLoadLocalUserSuccess(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserState.loadUserSuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoadLocalUserSuccess &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $UserStateLoadLocalUserSuccessCopyWith<UserStateLoadLocalUserSuccess>
      get copyWith => _$UserStateLoadLocalUserSuccessCopyWithImpl<
          UserStateLoadLocalUserSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadUserInProgress,
    required TResult Function(User user) loadUserSuccess,
    required TResult Function() loadUserFailed,
  }) {
    return loadUserSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
  }) {
    return loadUserSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
    required TResult orElse(),
  }) {
    if (loadUserSuccess != null) {
      return loadUserSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadUserFailed,
  }) {
    return loadUserSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
  }) {
    return loadUserSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
    required TResult orElse(),
  }) {
    if (loadUserSuccess != null) {
      return loadUserSuccess(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadLocalUserSuccess implements UserState {
  const factory UserStateLoadLocalUserSuccess(User user) =
      _$UserStateLoadLocalUserSuccess;

  User get user;
  @JsonKey(ignore: true)
  $UserStateLoadLocalUserSuccessCopyWith<UserStateLoadLocalUserSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateLoadLocalUserFailedCopyWith<$Res> {
  factory $UserStateLoadLocalUserFailedCopyWith(
          UserStateLoadLocalUserFailed value,
          $Res Function(UserStateLoadLocalUserFailed) then) =
      _$UserStateLoadLocalUserFailedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateLoadLocalUserFailedCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadLocalUserFailedCopyWith<$Res> {
  _$UserStateLoadLocalUserFailedCopyWithImpl(
      UserStateLoadLocalUserFailed _value,
      $Res Function(UserStateLoadLocalUserFailed) _then)
      : super(_value, (v) => _then(v as UserStateLoadLocalUserFailed));

  @override
  UserStateLoadLocalUserFailed get _value =>
      super._value as UserStateLoadLocalUserFailed;
}

/// @nodoc

class _$UserStateLoadLocalUserFailed implements UserStateLoadLocalUserFailed {
  const _$UserStateLoadLocalUserFailed();

  @override
  String toString() {
    return 'UserState.loadUserFailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoadLocalUserFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadUserInProgress,
    required TResult Function(User user) loadUserSuccess,
    required TResult Function() loadUserFailed,
  }) {
    return loadUserFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
  }) {
    return loadUserFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadUserInProgress,
    TResult Function(User user)? loadUserSuccess,
    TResult Function()? loadUserFailed,
    required TResult orElse(),
  }) {
    if (loadUserFailed != null) {
      return loadUserFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadUserFailed,
  }) {
    return loadUserFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
  }) {
    return loadUserFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadUserFailed,
    required TResult orElse(),
  }) {
    if (loadUserFailed != null) {
      return loadUserFailed(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadLocalUserFailed implements UserState {
  const factory UserStateLoadLocalUserFailed() = _$UserStateLoadLocalUserFailed;
}
