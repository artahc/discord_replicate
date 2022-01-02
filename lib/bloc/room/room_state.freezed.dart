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

  RoomStateLoadRecentRoomSuccess loadRoomSuccess(Room room) {
    return RoomStateLoadRecentRoomSuccess(
      room,
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
    required TResult Function(Room room) loadRoomSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Room room)? loadRoomSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Room room)? loadRoomSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomStateInitial value) initial,
    required TResult Function(RoomStateLoadRecentRoomSuccess value)
        loadRoomSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadRecentRoomSuccess value)? loadRoomSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadRecentRoomSuccess value)? loadRoomSuccess,
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
    required TResult Function(Room room) loadRoomSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Room room)? loadRoomSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Room room)? loadRoomSuccess,
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
    required TResult Function(RoomStateLoadRecentRoomSuccess value)
        loadRoomSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadRecentRoomSuccess value)? loadRoomSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadRecentRoomSuccess value)? loadRoomSuccess,
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
abstract class $RoomStateLoadRecentRoomSuccessCopyWith<$Res> {
  factory $RoomStateLoadRecentRoomSuccessCopyWith(
          RoomStateLoadRecentRoomSuccess value,
          $Res Function(RoomStateLoadRecentRoomSuccess) then) =
      _$RoomStateLoadRecentRoomSuccessCopyWithImpl<$Res>;
  $Res call({Room room});
}

/// @nodoc
class _$RoomStateLoadRecentRoomSuccessCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res>
    implements $RoomStateLoadRecentRoomSuccessCopyWith<$Res> {
  _$RoomStateLoadRecentRoomSuccessCopyWithImpl(
      RoomStateLoadRecentRoomSuccess _value,
      $Res Function(RoomStateLoadRecentRoomSuccess) _then)
      : super(_value, (v) => _then(v as RoomStateLoadRecentRoomSuccess));

  @override
  RoomStateLoadRecentRoomSuccess get _value =>
      super._value as RoomStateLoadRecentRoomSuccess;

  @override
  $Res call({
    Object? room = freezed,
  }) {
    return _then(RoomStateLoadRecentRoomSuccess(
      room == freezed
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

class _$RoomStateLoadRecentRoomSuccess
    implements RoomStateLoadRecentRoomSuccess {
  const _$RoomStateLoadRecentRoomSuccess(this.room);

  @override
  final Room room;

  @override
  String toString() {
    return 'RoomState.loadRoomSuccess(room: $room)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomStateLoadRecentRoomSuccess &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  $RoomStateLoadRecentRoomSuccessCopyWith<RoomStateLoadRecentRoomSuccess>
      get copyWith => _$RoomStateLoadRecentRoomSuccessCopyWithImpl<
          RoomStateLoadRecentRoomSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Room room) loadRoomSuccess,
  }) {
    return loadRoomSuccess(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Room room)? loadRoomSuccess,
  }) {
    return loadRoomSuccess?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Room room)? loadRoomSuccess,
    required TResult orElse(),
  }) {
    if (loadRoomSuccess != null) {
      return loadRoomSuccess(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomStateInitial value) initial,
    required TResult Function(RoomStateLoadRecentRoomSuccess value)
        loadRoomSuccess,
  }) {
    return loadRoomSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadRecentRoomSuccess value)? loadRoomSuccess,
  }) {
    return loadRoomSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomStateInitial value)? initial,
    TResult Function(RoomStateLoadRecentRoomSuccess value)? loadRoomSuccess,
    required TResult orElse(),
  }) {
    if (loadRoomSuccess != null) {
      return loadRoomSuccess(this);
    }
    return orElse();
  }
}

abstract class RoomStateLoadRecentRoomSuccess implements RoomState {
  const factory RoomStateLoadRecentRoomSuccess(Room room) =
      _$RoomStateLoadRecentRoomSuccess;

  Room get room;
  @JsonKey(ignore: true)
  $RoomStateLoadRecentRoomSuccessCopyWith<RoomStateLoadRecentRoomSuccess>
      get copyWith => throw _privateConstructorUsedError;
}
