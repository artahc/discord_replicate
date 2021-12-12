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

  LoadAllServer loadAll() {
    return const LoadAllServer();
  }

  LoadSelectedServer loadOne(String serverId) {
    return LoadSelectedServer(
      serverId,
    );
  }
}

/// @nodoc
const $ServerEvent = _$ServerEventTearOff();

/// @nodoc
mixin _$ServerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAll,
    required TResult Function(String serverId) loadOne,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(String serverId)? loadOne,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(String serverId)? loadOne,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAllServer value) loadAll,
    required TResult Function(LoadSelectedServer value) loadOne,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadAllServer value)? loadAll,
    TResult Function(LoadSelectedServer value)? loadOne,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAllServer value)? loadAll,
    TResult Function(LoadSelectedServer value)? loadOne,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerEventCopyWith<$Res> {
  factory $ServerEventCopyWith(
          ServerEvent value, $Res Function(ServerEvent) then) =
      _$ServerEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerEventCopyWithImpl<$Res> implements $ServerEventCopyWith<$Res> {
  _$ServerEventCopyWithImpl(this._value, this._then);

  final ServerEvent _value;
  // ignore: unused_field
  final $Res Function(ServerEvent) _then;
}

/// @nodoc
abstract class $LoadAllServerCopyWith<$Res> {
  factory $LoadAllServerCopyWith(
          LoadAllServer value, $Res Function(LoadAllServer) then) =
      _$LoadAllServerCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadAllServerCopyWithImpl<$Res> extends _$ServerEventCopyWithImpl<$Res>
    implements $LoadAllServerCopyWith<$Res> {
  _$LoadAllServerCopyWithImpl(
      LoadAllServer _value, $Res Function(LoadAllServer) _then)
      : super(_value, (v) => _then(v as LoadAllServer));

  @override
  LoadAllServer get _value => super._value as LoadAllServer;
}

/// @nodoc

class _$LoadAllServer implements LoadAllServer {
  const _$LoadAllServer();

  @override
  String toString() {
    return 'ServerEvent.loadAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadAllServer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAll,
    required TResult Function(String serverId) loadOne,
  }) {
    return loadAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(String serverId)? loadOne,
  }) {
    return loadAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(String serverId)? loadOne,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAllServer value) loadAll,
    required TResult Function(LoadSelectedServer value) loadOne,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadAllServer value)? loadAll,
    TResult Function(LoadSelectedServer value)? loadOne,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAllServer value)? loadAll,
    TResult Function(LoadSelectedServer value)? loadOne,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class LoadAllServer implements ServerEvent {
  const factory LoadAllServer() = _$LoadAllServer;
}

/// @nodoc
abstract class $LoadSelectedServerCopyWith<$Res> {
  factory $LoadSelectedServerCopyWith(
          LoadSelectedServer value, $Res Function(LoadSelectedServer) then) =
      _$LoadSelectedServerCopyWithImpl<$Res>;
  $Res call({String serverId});
}

/// @nodoc
class _$LoadSelectedServerCopyWithImpl<$Res>
    extends _$ServerEventCopyWithImpl<$Res>
    implements $LoadSelectedServerCopyWith<$Res> {
  _$LoadSelectedServerCopyWithImpl(
      LoadSelectedServer _value, $Res Function(LoadSelectedServer) _then)
      : super(_value, (v) => _then(v as LoadSelectedServer));

  @override
  LoadSelectedServer get _value => super._value as LoadSelectedServer;

  @override
  $Res call({
    Object? serverId = freezed,
  }) {
    return _then(LoadSelectedServer(
      serverId == freezed
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadSelectedServer implements LoadSelectedServer {
  const _$LoadSelectedServer(this.serverId);

  @override
  final String serverId;

  @override
  String toString() {
    return 'ServerEvent.loadOne(serverId: $serverId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadSelectedServer &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverId);

  @JsonKey(ignore: true)
  @override
  $LoadSelectedServerCopyWith<LoadSelectedServer> get copyWith =>
      _$LoadSelectedServerCopyWithImpl<LoadSelectedServer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAll,
    required TResult Function(String serverId) loadOne,
  }) {
    return loadOne(serverId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(String serverId)? loadOne,
  }) {
    return loadOne?.call(serverId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(String serverId)? loadOne,
    required TResult orElse(),
  }) {
    if (loadOne != null) {
      return loadOne(serverId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadAllServer value) loadAll,
    required TResult Function(LoadSelectedServer value) loadOne,
  }) {
    return loadOne(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadAllServer value)? loadAll,
    TResult Function(LoadSelectedServer value)? loadOne,
  }) {
    return loadOne?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadAllServer value)? loadAll,
    TResult Function(LoadSelectedServer value)? loadOne,
    required TResult orElse(),
  }) {
    if (loadOne != null) {
      return loadOne(this);
    }
    return orElse();
  }
}

abstract class LoadSelectedServer implements ServerEvent {
  const factory LoadSelectedServer(String serverId) = _$LoadSelectedServer;

  String get serverId;
  @JsonKey(ignore: true)
  $LoadSelectedServerCopyWith<LoadSelectedServer> get copyWith =>
      throw _privateConstructorUsedError;
}
