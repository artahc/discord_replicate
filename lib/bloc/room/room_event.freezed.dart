// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoomEventTearOff {
  const _$RoomEventTearOff();

  RoomEventLoadRoom loadRoom(String id) {
    return RoomEventLoadRoom(
      id,
    );
  }
}

/// @nodoc
const $RoomEvent = _$RoomEventTearOff();

/// @nodoc
mixin _$RoomEvent {
  String get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? loadRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomEventLoadRoom value) loadRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomEventLoadRoom value)? loadRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomEventLoadRoom value)? loadRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomEventCopyWith<RoomEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEventCopyWith<$Res> {
  factory $RoomEventCopyWith(RoomEvent value, $Res Function(RoomEvent) then) =
      _$RoomEventCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$RoomEventCopyWithImpl<$Res> implements $RoomEventCopyWith<$Res> {
  _$RoomEventCopyWithImpl(this._value, this._then);

  final RoomEvent _value;
  // ignore: unused_field
  final $Res Function(RoomEvent) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $RoomEventLoadRoomCopyWith<$Res>
    implements $RoomEventCopyWith<$Res> {
  factory $RoomEventLoadRoomCopyWith(
          RoomEventLoadRoom value, $Res Function(RoomEventLoadRoom) then) =
      _$RoomEventLoadRoomCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class _$RoomEventLoadRoomCopyWithImpl<$Res>
    extends _$RoomEventCopyWithImpl<$Res>
    implements $RoomEventLoadRoomCopyWith<$Res> {
  _$RoomEventLoadRoomCopyWithImpl(
      RoomEventLoadRoom _value, $Res Function(RoomEventLoadRoom) _then)
      : super(_value, (v) => _then(v as RoomEventLoadRoom));

  @override
  RoomEventLoadRoom get _value => super._value as RoomEventLoadRoom;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(RoomEventLoadRoom(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RoomEventLoadRoom implements RoomEventLoadRoom {
  const _$RoomEventLoadRoom(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'RoomEvent.loadRoom(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomEventLoadRoom &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  $RoomEventLoadRoomCopyWith<RoomEventLoadRoom> get copyWith =>
      _$RoomEventLoadRoomCopyWithImpl<RoomEventLoadRoom>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadRoom,
  }) {
    return loadRoom(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? loadRoom,
  }) {
    return loadRoom?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadRoom,
    required TResult orElse(),
  }) {
    if (loadRoom != null) {
      return loadRoom(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomEventLoadRoom value) loadRoom,
  }) {
    return loadRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomEventLoadRoom value)? loadRoom,
  }) {
    return loadRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomEventLoadRoom value)? loadRoom,
    required TResult orElse(),
  }) {
    if (loadRoom != null) {
      return loadRoom(this);
    }
    return orElse();
  }
}

abstract class RoomEventLoadRoom implements RoomEvent {
  const factory RoomEventLoadRoom(String id) = _$RoomEventLoadRoom;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  $RoomEventLoadRoomCopyWith<RoomEventLoadRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
