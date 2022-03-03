// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServerEventTearOff {
  const _$ServerEventTearOff();

  ServerEventLoadServer loadServer(String serverId) {
    return ServerEventLoadServer(
      serverId,
    );
  }

  ServerEventJoinServer joinServer(String serverId) {
    return ServerEventJoinServer(
      serverId,
    );
  }

  ServerEventLeaveServer leaveServer(String serverId) {
    return ServerEventLeaveServer(
      serverId,
    );
  }
}

/// @nodoc
const $ServerEvent = _$ServerEventTearOff();

/// @nodoc
mixin _$ServerEvent {
  String get serverId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverId) loadServer,
    required TResult Function(String serverId) joinServer,
    required TResult Function(String serverId) leaveServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerEventLoadServer value) loadServer,
    required TResult Function(ServerEventJoinServer value) joinServer,
    required TResult Function(ServerEventLeaveServer value) leaveServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerEventCopyWith<ServerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerEventCopyWith<$Res> {
  factory $ServerEventCopyWith(
          ServerEvent value, $Res Function(ServerEvent) then) =
      _$ServerEventCopyWithImpl<$Res>;
  $Res call({String serverId});
}

/// @nodoc
class _$ServerEventCopyWithImpl<$Res> implements $ServerEventCopyWith<$Res> {
  _$ServerEventCopyWithImpl(this._value, this._then);

  final ServerEvent _value;
  // ignore: unused_field
  final $Res Function(ServerEvent) _then;

  @override
  $Res call({
    Object? serverId = freezed,
  }) {
    return _then(_value.copyWith(
      serverId: serverId == freezed
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $ServerEventLoadServerCopyWith<$Res>
    implements $ServerEventCopyWith<$Res> {
  factory $ServerEventLoadServerCopyWith(ServerEventLoadServer value,
          $Res Function(ServerEventLoadServer) then) =
      _$ServerEventLoadServerCopyWithImpl<$Res>;
  @override
  $Res call({String serverId});
}

/// @nodoc
class _$ServerEventLoadServerCopyWithImpl<$Res>
    extends _$ServerEventCopyWithImpl<$Res>
    implements $ServerEventLoadServerCopyWith<$Res> {
  _$ServerEventLoadServerCopyWithImpl(
      ServerEventLoadServer _value, $Res Function(ServerEventLoadServer) _then)
      : super(_value, (v) => _then(v as ServerEventLoadServer));

  @override
  ServerEventLoadServer get _value => super._value as ServerEventLoadServer;

  @override
  $Res call({
    Object? serverId = freezed,
  }) {
    return _then(ServerEventLoadServer(
      serverId == freezed
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerEventLoadServer implements ServerEventLoadServer {
  const _$ServerEventLoadServer(this.serverId);

  @override
  final String serverId;

  @override
  String toString() {
    return 'ServerEvent.loadServer(serverId: $serverId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerEventLoadServer &&
            const DeepCollectionEquality().equals(other.serverId, serverId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(serverId));

  @JsonKey(ignore: true)
  @override
  $ServerEventLoadServerCopyWith<ServerEventLoadServer> get copyWith =>
      _$ServerEventLoadServerCopyWithImpl<ServerEventLoadServer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverId) loadServer,
    required TResult Function(String serverId) joinServer,
    required TResult Function(String serverId) leaveServer,
  }) {
    return loadServer(serverId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
  }) {
    return loadServer?.call(serverId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
    required TResult orElse(),
  }) {
    if (loadServer != null) {
      return loadServer(serverId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerEventLoadServer value) loadServer,
    required TResult Function(ServerEventJoinServer value) joinServer,
    required TResult Function(ServerEventLeaveServer value) leaveServer,
  }) {
    return loadServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
  }) {
    return loadServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
    required TResult orElse(),
  }) {
    if (loadServer != null) {
      return loadServer(this);
    }
    return orElse();
  }
}

abstract class ServerEventLoadServer implements ServerEvent {
  const factory ServerEventLoadServer(String serverId) =
      _$ServerEventLoadServer;

  @override
  String get serverId;
  @override
  @JsonKey(ignore: true)
  $ServerEventLoadServerCopyWith<ServerEventLoadServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerEventJoinServerCopyWith<$Res>
    implements $ServerEventCopyWith<$Res> {
  factory $ServerEventJoinServerCopyWith(ServerEventJoinServer value,
          $Res Function(ServerEventJoinServer) then) =
      _$ServerEventJoinServerCopyWithImpl<$Res>;
  @override
  $Res call({String serverId});
}

/// @nodoc
class _$ServerEventJoinServerCopyWithImpl<$Res>
    extends _$ServerEventCopyWithImpl<$Res>
    implements $ServerEventJoinServerCopyWith<$Res> {
  _$ServerEventJoinServerCopyWithImpl(
      ServerEventJoinServer _value, $Res Function(ServerEventJoinServer) _then)
      : super(_value, (v) => _then(v as ServerEventJoinServer));

  @override
  ServerEventJoinServer get _value => super._value as ServerEventJoinServer;

  @override
  $Res call({
    Object? serverId = freezed,
  }) {
    return _then(ServerEventJoinServer(
      serverId == freezed
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerEventJoinServer implements ServerEventJoinServer {
  const _$ServerEventJoinServer(this.serverId);

  @override
  final String serverId;

  @override
  String toString() {
    return 'ServerEvent.joinServer(serverId: $serverId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerEventJoinServer &&
            const DeepCollectionEquality().equals(other.serverId, serverId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(serverId));

  @JsonKey(ignore: true)
  @override
  $ServerEventJoinServerCopyWith<ServerEventJoinServer> get copyWith =>
      _$ServerEventJoinServerCopyWithImpl<ServerEventJoinServer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverId) loadServer,
    required TResult Function(String serverId) joinServer,
    required TResult Function(String serverId) leaveServer,
  }) {
    return joinServer(serverId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
  }) {
    return joinServer?.call(serverId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
    required TResult orElse(),
  }) {
    if (joinServer != null) {
      return joinServer(serverId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerEventLoadServer value) loadServer,
    required TResult Function(ServerEventJoinServer value) joinServer,
    required TResult Function(ServerEventLeaveServer value) leaveServer,
  }) {
    return joinServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
  }) {
    return joinServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
    required TResult orElse(),
  }) {
    if (joinServer != null) {
      return joinServer(this);
    }
    return orElse();
  }
}

abstract class ServerEventJoinServer implements ServerEvent {
  const factory ServerEventJoinServer(String serverId) =
      _$ServerEventJoinServer;

  @override
  String get serverId;
  @override
  @JsonKey(ignore: true)
  $ServerEventJoinServerCopyWith<ServerEventJoinServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerEventLeaveServerCopyWith<$Res>
    implements $ServerEventCopyWith<$Res> {
  factory $ServerEventLeaveServerCopyWith(ServerEventLeaveServer value,
          $Res Function(ServerEventLeaveServer) then) =
      _$ServerEventLeaveServerCopyWithImpl<$Res>;
  @override
  $Res call({String serverId});
}

/// @nodoc
class _$ServerEventLeaveServerCopyWithImpl<$Res>
    extends _$ServerEventCopyWithImpl<$Res>
    implements $ServerEventLeaveServerCopyWith<$Res> {
  _$ServerEventLeaveServerCopyWithImpl(ServerEventLeaveServer _value,
      $Res Function(ServerEventLeaveServer) _then)
      : super(_value, (v) => _then(v as ServerEventLeaveServer));

  @override
  ServerEventLeaveServer get _value => super._value as ServerEventLeaveServer;

  @override
  $Res call({
    Object? serverId = freezed,
  }) {
    return _then(ServerEventLeaveServer(
      serverId == freezed
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerEventLeaveServer implements ServerEventLeaveServer {
  const _$ServerEventLeaveServer(this.serverId);

  @override
  final String serverId;

  @override
  String toString() {
    return 'ServerEvent.leaveServer(serverId: $serverId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerEventLeaveServer &&
            const DeepCollectionEquality().equals(other.serverId, serverId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(serverId));

  @JsonKey(ignore: true)
  @override
  $ServerEventLeaveServerCopyWith<ServerEventLeaveServer> get copyWith =>
      _$ServerEventLeaveServerCopyWithImpl<ServerEventLeaveServer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverId) loadServer,
    required TResult Function(String serverId) joinServer,
    required TResult Function(String serverId) leaveServer,
  }) {
    return leaveServer(serverId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
  }) {
    return leaveServer?.call(serverId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverId)? loadServer,
    TResult Function(String serverId)? joinServer,
    TResult Function(String serverId)? leaveServer,
    required TResult orElse(),
  }) {
    if (leaveServer != null) {
      return leaveServer(serverId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerEventLoadServer value) loadServer,
    required TResult Function(ServerEventJoinServer value) joinServer,
    required TResult Function(ServerEventLeaveServer value) leaveServer,
  }) {
    return leaveServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
  }) {
    return leaveServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    TResult Function(ServerEventJoinServer value)? joinServer,
    TResult Function(ServerEventLeaveServer value)? leaveServer,
    required TResult orElse(),
  }) {
    if (leaveServer != null) {
      return leaveServer(this);
    }
    return orElse();
  }
}

abstract class ServerEventLeaveServer implements ServerEvent {
  const factory ServerEventLeaveServer(String serverId) =
      _$ServerEventLeaveServer;

  @override
  String get serverId;
  @override
  @JsonKey(ignore: true)
  $ServerEventLeaveServerCopyWith<ServerEventLeaveServer> get copyWith =>
      throw _privateConstructorUsedError;
}
