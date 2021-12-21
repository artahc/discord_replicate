// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoomStateTearOff {
  const _$RoomStateTearOff();

  RoomStateInitial initial() {
    return const RoomStateInitial();
  }

  RoomStateLoadingRoom roomLoadInProgress() {
    return const RoomStateLoadingRoom();
  }

  RoomStateLoadRoomSuccess roomLoadSuccess(Room room) {
    return RoomStateLoadRoomSuccess(
      room,
    );
  }

  RoomStateLoadRoomFailed roomLoadFailed(Exception error) {
    return RoomStateLoadRoomFailed(
      error,
    );
  }
}

/// @nodoc
const $RoomState = _$RoomStateTearOff();

/// @nodoc
mixin _$RoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() roomLoadInProgress,
    required TResult Function(Room room) roomLoadSuccess,
    required TResult Function(Exception error) roomLoadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomStateInitial value) initial,
    required TResult Function(RoomStateLoadingRoom value) roomLoadInProgress,
    required TResult Function(RoomStateLoadRoomSuccess value) roomLoadSuccess,
    required TResult Function(RoomStateLoadRoomFailed value) roomLoadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res> implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  final RoomState _value;
  // ignore: unused_field
  final $Res Function(RoomState) _then;
}

/// @nodoc
abstract class $RoomStateInitialCopyWith<$Res> {
  factory $RoomStateInitialCopyWith(
          RoomStateInitial value, $Res Function(RoomStateInitial) then) =
      _$RoomStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomStateInitialCopyWithImpl<$Res> extends _$RoomStateCopyWithImpl<$Res>
    implements $RoomStateInitialCopyWith<$Res> {
  _$RoomStateInitialCopyWithImpl(
      RoomStateInitial _value, $Res Function(RoomStateInitial) _then)
      : super(_value, (v) => _then(v as RoomStateInitial));

  @override
  RoomStateInitial get _value => super._value as RoomStateInitial;
}

/// @nodoc

class _$RoomStateInitial implements RoomStateInitial {
  const _$RoomStateInitial();

  @override
  String toString() {
    return 'RoomState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RoomStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() roomLoadInProgress,
    required TResult Function(Room room) roomLoadSuccess,
    required TResult Function(Exception error) roomLoadFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
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
    required TResult Function(RoomStateInitial value) initial,
    required TResult Function(RoomStateLoadingRoom value) roomLoadInProgress,
    required TResult Function(RoomStateLoadRoomSuccess value) roomLoadSuccess,
    required TResult Function(RoomStateLoadRoomFailed value) roomLoadFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RoomStateInitial implements RoomState {
  const factory RoomStateInitial() = _$RoomStateInitial;
}

/// @nodoc
abstract class $RoomStateLoadingRoomCopyWith<$Res> {
  factory $RoomStateLoadingRoomCopyWith(RoomStateLoadingRoom value,
          $Res Function(RoomStateLoadingRoom) then) =
      _$RoomStateLoadingRoomCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomStateLoadingRoomCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res>
    implements $RoomStateLoadingRoomCopyWith<$Res> {
  _$RoomStateLoadingRoomCopyWithImpl(
      RoomStateLoadingRoom _value, $Res Function(RoomStateLoadingRoom) _then)
      : super(_value, (v) => _then(v as RoomStateLoadingRoom));

  @override
  RoomStateLoadingRoom get _value => super._value as RoomStateLoadingRoom;
}

/// @nodoc

class _$RoomStateLoadingRoom implements RoomStateLoadingRoom {
  const _$RoomStateLoadingRoom();

  @override
  String toString() {
    return 'RoomState.roomLoadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RoomStateLoadingRoom);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() roomLoadInProgress,
    required TResult Function(Room room) roomLoadSuccess,
    required TResult Function(Exception error) roomLoadFailed,
  }) {
    return roomLoadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
  }) {
    return roomLoadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
    required TResult orElse(),
  }) {
    if (roomLoadInProgress != null) {
      return roomLoadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomStateInitial value) initial,
    required TResult Function(RoomStateLoadingRoom value) roomLoadInProgress,
    required TResult Function(RoomStateLoadRoomSuccess value) roomLoadSuccess,
    required TResult Function(RoomStateLoadRoomFailed value) roomLoadFailed,
  }) {
    return roomLoadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
  }) {
    return roomLoadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
    required TResult orElse(),
  }) {
    if (roomLoadInProgress != null) {
      return roomLoadInProgress(this);
    }
    return orElse();
  }
}

abstract class RoomStateLoadingRoom implements RoomState {
  const factory RoomStateLoadingRoom() = _$RoomStateLoadingRoom;
}

/// @nodoc
abstract class $RoomStateLoadRoomSuccessCopyWith<$Res> {
  factory $RoomStateLoadRoomSuccessCopyWith(RoomStateLoadRoomSuccess value,
          $Res Function(RoomStateLoadRoomSuccess) then) =
      _$RoomStateLoadRoomSuccessCopyWithImpl<$Res>;
  $Res call({Room room});
}

/// @nodoc
class _$RoomStateLoadRoomSuccessCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res>
    implements $RoomStateLoadRoomSuccessCopyWith<$Res> {
  _$RoomStateLoadRoomSuccessCopyWithImpl(RoomStateLoadRoomSuccess _value,
      $Res Function(RoomStateLoadRoomSuccess) _then)
      : super(_value, (v) => _then(v as RoomStateLoadRoomSuccess));

  @override
  RoomStateLoadRoomSuccess get _value =>
      super._value as RoomStateLoadRoomSuccess;

  @override
  $Res call({
    Object? room = freezed,
  }) {
    return _then(RoomStateLoadRoomSuccess(
      room == freezed
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

class _$RoomStateLoadRoomSuccess implements RoomStateLoadRoomSuccess {
  const _$RoomStateLoadRoomSuccess(this.room);

  @override
  final Room room;

  @override
  String toString() {
    return 'RoomState.roomLoadSuccess(room: $room)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomStateLoadRoomSuccess &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  $RoomStateLoadRoomSuccessCopyWith<RoomStateLoadRoomSuccess> get copyWith =>
      _$RoomStateLoadRoomSuccessCopyWithImpl<RoomStateLoadRoomSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() roomLoadInProgress,
    required TResult Function(Room room) roomLoadSuccess,
    required TResult Function(Exception error) roomLoadFailed,
  }) {
    return roomLoadSuccess(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
  }) {
    return roomLoadSuccess?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
    required TResult orElse(),
  }) {
    if (roomLoadSuccess != null) {
      return roomLoadSuccess(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomStateInitial value) initial,
    required TResult Function(RoomStateLoadingRoom value) roomLoadInProgress,
    required TResult Function(RoomStateLoadRoomSuccess value) roomLoadSuccess,
    required TResult Function(RoomStateLoadRoomFailed value) roomLoadFailed,
  }) {
    return roomLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
  }) {
    return roomLoadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
    required TResult orElse(),
  }) {
    if (roomLoadSuccess != null) {
      return roomLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class RoomStateLoadRoomSuccess implements RoomState {
  const factory RoomStateLoadRoomSuccess(Room room) =
      _$RoomStateLoadRoomSuccess;

  Room get room;
  @JsonKey(ignore: true)
  $RoomStateLoadRoomSuccessCopyWith<RoomStateLoadRoomSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateLoadRoomFailedCopyWith<$Res> {
  factory $RoomStateLoadRoomFailedCopyWith(RoomStateLoadRoomFailed value,
          $Res Function(RoomStateLoadRoomFailed) then) =
      _$RoomStateLoadRoomFailedCopyWithImpl<$Res>;
  $Res call({Exception error});
}

/// @nodoc
class _$RoomStateLoadRoomFailedCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res>
    implements $RoomStateLoadRoomFailedCopyWith<$Res> {
  _$RoomStateLoadRoomFailedCopyWithImpl(RoomStateLoadRoomFailed _value,
      $Res Function(RoomStateLoadRoomFailed) _then)
      : super(_value, (v) => _then(v as RoomStateLoadRoomFailed));

  @override
  RoomStateLoadRoomFailed get _value => super._value as RoomStateLoadRoomFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(RoomStateLoadRoomFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$RoomStateLoadRoomFailed implements RoomStateLoadRoomFailed {
  const _$RoomStateLoadRoomFailed(this.error);

  @override
  final Exception error;

  @override
  String toString() {
    return 'RoomState.roomLoadFailed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomStateLoadRoomFailed &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  $RoomStateLoadRoomFailedCopyWith<RoomStateLoadRoomFailed> get copyWith =>
      _$RoomStateLoadRoomFailedCopyWithImpl<RoomStateLoadRoomFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() roomLoadInProgress,
    required TResult Function(Room room) roomLoadSuccess,
    required TResult Function(Exception error) roomLoadFailed,
  }) {
    return roomLoadFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
  }) {
    return roomLoadFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? roomLoadInProgress,
    TResult Function(Room room)? roomLoadSuccess,
    TResult Function(Exception error)? roomLoadFailed,
    required TResult orElse(),
  }) {
    if (roomLoadFailed != null) {
      return roomLoadFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomStateInitial value) initial,
    required TResult Function(RoomStateLoadingRoom value) roomLoadInProgress,
    required TResult Function(RoomStateLoadRoomSuccess value) roomLoadSuccess,
    required TResult Function(RoomStateLoadRoomFailed value) roomLoadFailed,
  }) {
    return roomLoadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
  }) {
    return roomLoadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadingRoom value)? roomLoadInProgress,
    TResult Function(RoomStateLoadRoomSuccess value)? roomLoadSuccess,
    TResult Function(RoomStateLoadRoomFailed value)? roomLoadFailed,
    required TResult orElse(),
  }) {
    if (roomLoadFailed != null) {
      return roomLoadFailed(this);
    }
    return orElse();
  }
}

abstract class RoomStateLoadRoomFailed implements RoomState {
  const factory RoomStateLoadRoomFailed(Exception error) =
      _$RoomStateLoadRoomFailed;

  Exception get error;
  @JsonKey(ignore: true)
  $RoomStateLoadRoomFailedCopyWith<RoomStateLoadRoomFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
