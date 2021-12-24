// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

  RoomEventLoadLastPrivateRoom loadRecentPrivateRoom() {
    return const RoomEventLoadLastPrivateRoom();
  }

  RoomEventLoadRoom loadRecentServerRoom(String serverId) {
    return RoomEventLoadRoom(
      serverId,
    );
  }
}

/// @nodoc
const $RoomEvent = _$RoomEventTearOff();

/// @nodoc
mixin _$RoomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRecentPrivateRoom,
    required TResult Function(String serverId) loadRecentServerRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadRecentPrivateRoom,
    TResult Function(String serverId)? loadRecentServerRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRecentPrivateRoom,
    TResult Function(String serverId)? loadRecentServerRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomEventLoadLastPrivateRoom value)
        loadRecentPrivateRoom,
    required TResult Function(RoomEventLoadRoom value) loadRecentServerRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomEventLoadLastPrivateRoom value)? loadRecentPrivateRoom,
    TResult Function(RoomEventLoadRoom value)? loadRecentServerRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomEventLoadLastPrivateRoom value)? loadRecentPrivateRoom,
    TResult Function(RoomEventLoadRoom value)? loadRecentServerRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEventCopyWith<$Res> {
  factory $RoomEventCopyWith(RoomEvent value, $Res Function(RoomEvent) then) =
      _$RoomEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomEventCopyWithImpl<$Res> implements $RoomEventCopyWith<$Res> {
  _$RoomEventCopyWithImpl(this._value, this._then);

  final RoomEvent _value;
  // ignore: unused_field
  final $Res Function(RoomEvent) _then;
}

/// @nodoc
abstract class $RoomEventLoadLastPrivateRoomCopyWith<$Res> {
  factory $RoomEventLoadLastPrivateRoomCopyWith(
          RoomEventLoadLastPrivateRoom value,
          $Res Function(RoomEventLoadLastPrivateRoom) then) =
      _$RoomEventLoadLastPrivateRoomCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomEventLoadLastPrivateRoomCopyWithImpl<$Res>
    extends _$RoomEventCopyWithImpl<$Res>
    implements $RoomEventLoadLastPrivateRoomCopyWith<$Res> {
  _$RoomEventLoadLastPrivateRoomCopyWithImpl(
      RoomEventLoadLastPrivateRoom _value,
      $Res Function(RoomEventLoadLastPrivateRoom) _then)
      : super(_value, (v) => _then(v as RoomEventLoadLastPrivateRoom));

  @override
  RoomEventLoadLastPrivateRoom get _value =>
      super._value as RoomEventLoadLastPrivateRoom;
}

/// @nodoc

class _$RoomEventLoadLastPrivateRoom implements RoomEventLoadLastPrivateRoom {
  const _$RoomEventLoadLastPrivateRoom();

  @override
  String toString() {
    return 'RoomEvent.loadRecentPrivateRoom()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomEventLoadLastPrivateRoom);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRecentPrivateRoom,
    required TResult Function(String serverId) loadRecentServerRoom,
  }) {
    return loadRecentPrivateRoom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadRecentPrivateRoom,
    TResult Function(String serverId)? loadRecentServerRoom,
  }) {
    return loadRecentPrivateRoom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRecentPrivateRoom,
    TResult Function(String serverId)? loadRecentServerRoom,
    required TResult orElse(),
  }) {
    if (loadRecentPrivateRoom != null) {
      return loadRecentPrivateRoom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomEventLoadLastPrivateRoom value)
        loadRecentPrivateRoom,
    required TResult Function(RoomEventLoadRoom value) loadRecentServerRoom,
  }) {
    return loadRecentPrivateRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomEventLoadLastPrivateRoom value)? loadRecentPrivateRoom,
    TResult Function(RoomEventLoadRoom value)? loadRecentServerRoom,
  }) {
    return loadRecentPrivateRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomEventLoadLastPrivateRoom value)? loadRecentPrivateRoom,
    TResult Function(RoomEventLoadRoom value)? loadRecentServerRoom,
    required TResult orElse(),
  }) {
    if (loadRecentPrivateRoom != null) {
      return loadRecentPrivateRoom(this);
    }
    return orElse();
  }
}

abstract class RoomEventLoadLastPrivateRoom implements RoomEvent {
  const factory RoomEventLoadLastPrivateRoom() = _$RoomEventLoadLastPrivateRoom;
}

/// @nodoc
abstract class $RoomEventLoadRoomCopyWith<$Res> {
  factory $RoomEventLoadRoomCopyWith(
          RoomEventLoadRoom value, $Res Function(RoomEventLoadRoom) then) =
      _$RoomEventLoadRoomCopyWithImpl<$Res>;
  $Res call({String serverId});
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
    Object? serverId = freezed,
  }) {
    return _then(RoomEventLoadRoom(
      serverId == freezed
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RoomEventLoadRoom implements RoomEventLoadRoom {
  const _$RoomEventLoadRoom(this.serverId);

  @override
  final String serverId;

  @override
  String toString() {
    return 'RoomEvent.loadRecentServerRoom(serverId: $serverId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoomEventLoadRoom &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverId);

  @JsonKey(ignore: true)
  @override
  $RoomEventLoadRoomCopyWith<RoomEventLoadRoom> get copyWith =>
      _$RoomEventLoadRoomCopyWithImpl<RoomEventLoadRoom>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRecentPrivateRoom,
    required TResult Function(String serverId) loadRecentServerRoom,
  }) {
    return loadRecentServerRoom(serverId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadRecentPrivateRoom,
    TResult Function(String serverId)? loadRecentServerRoom,
  }) {
    return loadRecentServerRoom?.call(serverId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRecentPrivateRoom,
    TResult Function(String serverId)? loadRecentServerRoom,
    required TResult orElse(),
  }) {
    if (loadRecentServerRoom != null) {
      return loadRecentServerRoom(serverId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomEventLoadLastPrivateRoom value)
        loadRecentPrivateRoom,
    required TResult Function(RoomEventLoadRoom value) loadRecentServerRoom,
  }) {
    return loadRecentServerRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomEventLoadLastPrivateRoom value)? loadRecentPrivateRoom,
    TResult Function(RoomEventLoadRoom value)? loadRecentServerRoom,
  }) {
    return loadRecentServerRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomEventLoadLastPrivateRoom value)? loadRecentPrivateRoom,
    TResult Function(RoomEventLoadRoom value)? loadRecentServerRoom,
    required TResult orElse(),
  }) {
    if (loadRecentServerRoom != null) {
      return loadRecentServerRoom(this);
    }
    return orElse();
  }
}

abstract class RoomEventLoadRoom implements RoomEvent {
  const factory RoomEventLoadRoom(String serverId) = _$RoomEventLoadRoom;

  String get serverId;
  @JsonKey(ignore: true)
  $RoomEventLoadRoomCopyWith<RoomEventLoadRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
