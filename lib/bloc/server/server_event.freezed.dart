// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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

  ServerEventLoadServer loadServer(String id) {
    return ServerEventLoadServer(
      id,
    );
  }
}

/// @nodoc
const $ServerEvent = _$ServerEventTearOff();

/// @nodoc
mixin _$ServerEvent {
  String get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? loadServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerEventLoadServer value) loadServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
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
  $Res call({String id});
}

/// @nodoc
class _$ServerEventCopyWithImpl<$Res> implements $ServerEventCopyWith<$Res> {
  _$ServerEventCopyWithImpl(this._value, this._then);

  final ServerEvent _value;
  // ignore: unused_field
  final $Res Function(ServerEvent) _then;

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
abstract class $ServerEventLoadServerCopyWith<$Res>
    implements $ServerEventCopyWith<$Res> {
  factory $ServerEventLoadServerCopyWith(ServerEventLoadServer value,
          $Res Function(ServerEventLoadServer) then) =
      _$ServerEventLoadServerCopyWithImpl<$Res>;
  @override
  $Res call({String id});
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
    Object? id = freezed,
  }) {
    return _then(ServerEventLoadServer(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerEventLoadServer implements ServerEventLoadServer {
  const _$ServerEventLoadServer(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ServerEvent.loadServer(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerEventLoadServer &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  $ServerEventLoadServerCopyWith<ServerEventLoadServer> get copyWith =>
      _$ServerEventLoadServerCopyWithImpl<ServerEventLoadServer>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) loadServer,
  }) {
    return loadServer(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? loadServer,
  }) {
    return loadServer?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? loadServer,
    required TResult orElse(),
  }) {
    if (loadServer != null) {
      return loadServer(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerEventLoadServer value) loadServer,
  }) {
    return loadServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
  }) {
    return loadServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerEventLoadServer value)? loadServer,
    required TResult orElse(),
  }) {
    if (loadServer != null) {
      return loadServer(this);
    }
    return orElse();
  }
}

abstract class ServerEventLoadServer implements ServerEvent {
  const factory ServerEventLoadServer(String id) = _$ServerEventLoadServer;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  $ServerEventLoadServerCopyWith<ServerEventLoadServer> get copyWith =>
      throw _privateConstructorUsedError;
}
