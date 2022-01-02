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

  UserStateLoadRecentPrivateRoomInProgress loadRecentPrivateRoomInProgress() {
    return const UserStateLoadRecentPrivateRoomInProgress();
  }

  UserStateLoadRecentPrivateRoomSuccess loadRecentPrivateRoomSuccess(
      List<Room> rooms, Room recentRoom) {
    return UserStateLoadRecentPrivateRoomSuccess(
      rooms,
      recentRoom,
    );
  }

  UserStateLoadLocalUserInProgress loadLocalUserInProgress() {
    return const UserStateLoadLocalUserInProgress();
  }

  UserStateLoadLocalUserSuccess loadLocalUserSuccess(User user) {
    return UserStateLoadLocalUserSuccess(
      user,
    );
  }

  UserStateLoadLocalUserFailed loadLocalUserFailed() {
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
    required TResult Function() loadRecentPrivateRoomInProgress,
    required TResult Function(List<Room> rooms, Room recentRoom)
        loadRecentPrivateRoomSuccess,
    required TResult Function() loadLocalUserInProgress,
    required TResult Function(User user) loadLocalUserSuccess,
    required TResult Function() loadLocalUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadRecentPrivateRoomInProgress value)
        loadRecentPrivateRoomInProgress,
    required TResult Function(UserStateLoadRecentPrivateRoomSuccess value)
        loadRecentPrivateRoomSuccess,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadLocalUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadLocalUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadLocalUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
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
    required TResult Function() loadRecentPrivateRoomInProgress,
    required TResult Function(List<Room> rooms, Room recentRoom)
        loadRecentPrivateRoomSuccess,
    required TResult Function() loadLocalUserInProgress,
    required TResult Function(User user) loadLocalUserSuccess,
    required TResult Function() loadLocalUserFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
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
    required TResult Function(UserStateLoadRecentPrivateRoomInProgress value)
        loadRecentPrivateRoomInProgress,
    required TResult Function(UserStateLoadRecentPrivateRoomSuccess value)
        loadRecentPrivateRoomSuccess,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadLocalUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadLocalUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadLocalUserFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
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
abstract class $UserStateLoadRecentPrivateRoomInProgressCopyWith<$Res> {
  factory $UserStateLoadRecentPrivateRoomInProgressCopyWith(
          UserStateLoadRecentPrivateRoomInProgress value,
          $Res Function(UserStateLoadRecentPrivateRoomInProgress) then) =
      _$UserStateLoadRecentPrivateRoomInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateLoadRecentPrivateRoomInProgressCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadRecentPrivateRoomInProgressCopyWith<$Res> {
  _$UserStateLoadRecentPrivateRoomInProgressCopyWithImpl(
      UserStateLoadRecentPrivateRoomInProgress _value,
      $Res Function(UserStateLoadRecentPrivateRoomInProgress) _then)
      : super(_value,
            (v) => _then(v as UserStateLoadRecentPrivateRoomInProgress));

  @override
  UserStateLoadRecentPrivateRoomInProgress get _value =>
      super._value as UserStateLoadRecentPrivateRoomInProgress;
}

/// @nodoc

class _$UserStateLoadRecentPrivateRoomInProgress
    implements UserStateLoadRecentPrivateRoomInProgress {
  const _$UserStateLoadRecentPrivateRoomInProgress();

  @override
  String toString() {
    return 'UserState.loadRecentPrivateRoomInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoadRecentPrivateRoomInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadRecentPrivateRoomInProgress,
    required TResult Function(List<Room> rooms, Room recentRoom)
        loadRecentPrivateRoomSuccess,
    required TResult Function() loadLocalUserInProgress,
    required TResult Function(User user) loadLocalUserSuccess,
    required TResult Function() loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadRecentPrivateRoomInProgress != null) {
      return loadRecentPrivateRoomInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadRecentPrivateRoomInProgress value)
        loadRecentPrivateRoomInProgress,
    required TResult Function(UserStateLoadRecentPrivateRoomSuccess value)
        loadRecentPrivateRoomSuccess,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadLocalUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadLocalUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadRecentPrivateRoomInProgress != null) {
      return loadRecentPrivateRoomInProgress(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadRecentPrivateRoomInProgress implements UserState {
  const factory UserStateLoadRecentPrivateRoomInProgress() =
      _$UserStateLoadRecentPrivateRoomInProgress;
}

/// @nodoc
abstract class $UserStateLoadRecentPrivateRoomSuccessCopyWith<$Res> {
  factory $UserStateLoadRecentPrivateRoomSuccessCopyWith(
          UserStateLoadRecentPrivateRoomSuccess value,
          $Res Function(UserStateLoadRecentPrivateRoomSuccess) then) =
      _$UserStateLoadRecentPrivateRoomSuccessCopyWithImpl<$Res>;
  $Res call({List<Room> rooms, Room recentRoom});
}

/// @nodoc
class _$UserStateLoadRecentPrivateRoomSuccessCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res>
    implements $UserStateLoadRecentPrivateRoomSuccessCopyWith<$Res> {
  _$UserStateLoadRecentPrivateRoomSuccessCopyWithImpl(
      UserStateLoadRecentPrivateRoomSuccess _value,
      $Res Function(UserStateLoadRecentPrivateRoomSuccess) _then)
      : super(_value, (v) => _then(v as UserStateLoadRecentPrivateRoomSuccess));

  @override
  UserStateLoadRecentPrivateRoomSuccess get _value =>
      super._value as UserStateLoadRecentPrivateRoomSuccess;

  @override
  $Res call({
    Object? rooms = freezed,
    Object? recentRoom = freezed,
  }) {
    return _then(UserStateLoadRecentPrivateRoomSuccess(
      rooms == freezed
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      recentRoom == freezed
          ? _value.recentRoom
          : recentRoom // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

class _$UserStateLoadRecentPrivateRoomSuccess
    implements UserStateLoadRecentPrivateRoomSuccess {
  const _$UserStateLoadRecentPrivateRoomSuccess(this.rooms, this.recentRoom);

  @override
  final List<Room> rooms;
  @override
  final Room recentRoom;

  @override
  String toString() {
    return 'UserState.loadRecentPrivateRoomSuccess(rooms: $rooms, recentRoom: $recentRoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoadRecentPrivateRoomSuccess &&
            const DeepCollectionEquality().equals(other.rooms, rooms) &&
            (identical(other.recentRoom, recentRoom) ||
                other.recentRoom == recentRoom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(rooms), recentRoom);

  @JsonKey(ignore: true)
  @override
  $UserStateLoadRecentPrivateRoomSuccessCopyWith<
          UserStateLoadRecentPrivateRoomSuccess>
      get copyWith => _$UserStateLoadRecentPrivateRoomSuccessCopyWithImpl<
          UserStateLoadRecentPrivateRoomSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadRecentPrivateRoomInProgress,
    required TResult Function(List<Room> rooms, Room recentRoom)
        loadRecentPrivateRoomSuccess,
    required TResult Function() loadLocalUserInProgress,
    required TResult Function(User user) loadLocalUserSuccess,
    required TResult Function() loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomSuccess(rooms, recentRoom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomSuccess?.call(rooms, recentRoom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadRecentPrivateRoomSuccess != null) {
      return loadRecentPrivateRoomSuccess(rooms, recentRoom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadRecentPrivateRoomInProgress value)
        loadRecentPrivateRoomInProgress,
    required TResult Function(UserStateLoadRecentPrivateRoomSuccess value)
        loadRecentPrivateRoomSuccess,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadLocalUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadLocalUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
  }) {
    return loadRecentPrivateRoomSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadRecentPrivateRoomSuccess != null) {
      return loadRecentPrivateRoomSuccess(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadRecentPrivateRoomSuccess implements UserState {
  const factory UserStateLoadRecentPrivateRoomSuccess(
          List<Room> rooms, Room recentRoom) =
      _$UserStateLoadRecentPrivateRoomSuccess;

  List<Room> get rooms;
  Room get recentRoom;
  @JsonKey(ignore: true)
  $UserStateLoadRecentPrivateRoomSuccessCopyWith<
          UserStateLoadRecentPrivateRoomSuccess>
      get copyWith => throw _privateConstructorUsedError;
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
    return 'UserState.loadLocalUserInProgress()';
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
    required TResult Function() loadRecentPrivateRoomInProgress,
    required TResult Function(List<Room> rooms, Room recentRoom)
        loadRecentPrivateRoomSuccess,
    required TResult Function() loadLocalUserInProgress,
    required TResult Function(User user) loadLocalUserSuccess,
    required TResult Function() loadLocalUserFailed,
  }) {
    return loadLocalUserInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
  }) {
    return loadLocalUserInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadLocalUserInProgress != null) {
      return loadLocalUserInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadRecentPrivateRoomInProgress value)
        loadRecentPrivateRoomInProgress,
    required TResult Function(UserStateLoadRecentPrivateRoomSuccess value)
        loadRecentPrivateRoomSuccess,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadLocalUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadLocalUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadLocalUserFailed,
  }) {
    return loadLocalUserInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
  }) {
    return loadLocalUserInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadLocalUserInProgress != null) {
      return loadLocalUserInProgress(this);
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
    return 'UserState.loadLocalUserSuccess(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserStateLoadLocalUserSuccess &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  $UserStateLoadLocalUserSuccessCopyWith<UserStateLoadLocalUserSuccess>
      get copyWith => _$UserStateLoadLocalUserSuccessCopyWithImpl<
          UserStateLoadLocalUserSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadRecentPrivateRoomInProgress,
    required TResult Function(List<Room> rooms, Room recentRoom)
        loadRecentPrivateRoomSuccess,
    required TResult Function() loadLocalUserInProgress,
    required TResult Function(User user) loadLocalUserSuccess,
    required TResult Function() loadLocalUserFailed,
  }) {
    return loadLocalUserSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
  }) {
    return loadLocalUserSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadLocalUserSuccess != null) {
      return loadLocalUserSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadRecentPrivateRoomInProgress value)
        loadRecentPrivateRoomInProgress,
    required TResult Function(UserStateLoadRecentPrivateRoomSuccess value)
        loadRecentPrivateRoomSuccess,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadLocalUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadLocalUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadLocalUserFailed,
  }) {
    return loadLocalUserSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
  }) {
    return loadLocalUserSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadLocalUserSuccess != null) {
      return loadLocalUserSuccess(this);
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
    return 'UserState.loadLocalUserFailed()';
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
    required TResult Function() loadRecentPrivateRoomInProgress,
    required TResult Function(List<Room> rooms, Room recentRoom)
        loadRecentPrivateRoomSuccess,
    required TResult Function() loadLocalUserInProgress,
    required TResult Function(User user) loadLocalUserSuccess,
    required TResult Function() loadLocalUserFailed,
  }) {
    return loadLocalUserFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
  }) {
    return loadLocalUserFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadRecentPrivateRoomInProgress,
    TResult Function(List<Room> rooms, Room recentRoom)?
        loadRecentPrivateRoomSuccess,
    TResult Function()? loadLocalUserInProgress,
    TResult Function(User user)? loadLocalUserSuccess,
    TResult Function()? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadLocalUserFailed != null) {
      return loadLocalUserFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserStateInitial value) initial,
    required TResult Function(UserStateLoadRecentPrivateRoomInProgress value)
        loadRecentPrivateRoomInProgress,
    required TResult Function(UserStateLoadRecentPrivateRoomSuccess value)
        loadRecentPrivateRoomSuccess,
    required TResult Function(UserStateLoadLocalUserInProgress value)
        loadLocalUserInProgress,
    required TResult Function(UserStateLoadLocalUserSuccess value)
        loadLocalUserSuccess,
    required TResult Function(UserStateLoadLocalUserFailed value)
        loadLocalUserFailed,
  }) {
    return loadLocalUserFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
  }) {
    return loadLocalUserFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserStateInitial value)? initial,
    TResult Function(UserStateLoadRecentPrivateRoomInProgress value)?
        loadRecentPrivateRoomInProgress,
    TResult Function(UserStateLoadRecentPrivateRoomSuccess value)?
        loadRecentPrivateRoomSuccess,
    TResult Function(UserStateLoadLocalUserInProgress value)?
        loadLocalUserInProgress,
    TResult Function(UserStateLoadLocalUserSuccess value)? loadLocalUserSuccess,
    TResult Function(UserStateLoadLocalUserFailed value)? loadLocalUserFailed,
    required TResult orElse(),
  }) {
    if (loadLocalUserFailed != null) {
      return loadLocalUserFailed(this);
    }
    return orElse();
  }
}

abstract class UserStateLoadLocalUserFailed implements UserState {
  const factory UserStateLoadLocalUserFailed() = _$UserStateLoadLocalUserFailed;
}
