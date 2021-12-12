// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'server_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServerStateTearOff {
  const _$ServerStateTearOff();

  ServerStateInitial initial() {
    return const ServerStateInitial();
  }

  ServerStateLoadListSuccess loadListSuccess(List<Server> servers) {
    return ServerStateLoadListSuccess(
      servers,
    );
  }

  ServerStateLoadSelectedSuccess loadSelectedSuccess(Server server) {
    return ServerStateLoadSelectedSuccess(
      server,
    );
  }
}

/// @nodoc
const $ServerState = _$ServerStateTearOff();

/// @nodoc
mixin _$ServerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Server> servers) loadListSuccess,
    required TResult Function(Server server) loadSelectedSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateInitial value) initial,
    required TResult Function(ServerStateLoadListSuccess value) loadListSuccess,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadSelectedSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerStateCopyWith<$Res> {
  factory $ServerStateCopyWith(
          ServerState value, $Res Function(ServerState) then) =
      _$ServerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerStateCopyWithImpl<$Res> implements $ServerStateCopyWith<$Res> {
  _$ServerStateCopyWithImpl(this._value, this._then);

  final ServerState _value;
  // ignore: unused_field
  final $Res Function(ServerState) _then;
}

/// @nodoc
abstract class $ServerStateInitialCopyWith<$Res> {
  factory $ServerStateInitialCopyWith(
          ServerStateInitial value, $Res Function(ServerStateInitial) then) =
      _$ServerStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerStateInitialCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res>
    implements $ServerStateInitialCopyWith<$Res> {
  _$ServerStateInitialCopyWithImpl(
      ServerStateInitial _value, $Res Function(ServerStateInitial) _then)
      : super(_value, (v) => _then(v as ServerStateInitial));

  @override
  ServerStateInitial get _value => super._value as ServerStateInitial;
}

/// @nodoc

class _$ServerStateInitial implements ServerStateInitial {
  const _$ServerStateInitial();

  @override
  String toString() {
    return 'ServerState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Server> servers) loadListSuccess,
    required TResult Function(Server server) loadSelectedSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
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
    required TResult Function(ServerStateInitial value) initial,
    required TResult Function(ServerStateLoadListSuccess value) loadListSuccess,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadSelectedSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ServerStateInitial implements ServerState {
  const factory ServerStateInitial() = _$ServerStateInitial;
}

/// @nodoc
abstract class $ServerStateLoadListSuccessCopyWith<$Res> {
  factory $ServerStateLoadListSuccessCopyWith(ServerStateLoadListSuccess value,
          $Res Function(ServerStateLoadListSuccess) then) =
      _$ServerStateLoadListSuccessCopyWithImpl<$Res>;
  $Res call({List<Server> servers});
}

/// @nodoc
class _$ServerStateLoadListSuccessCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res>
    implements $ServerStateLoadListSuccessCopyWith<$Res> {
  _$ServerStateLoadListSuccessCopyWithImpl(ServerStateLoadListSuccess _value,
      $Res Function(ServerStateLoadListSuccess) _then)
      : super(_value, (v) => _then(v as ServerStateLoadListSuccess));

  @override
  ServerStateLoadListSuccess get _value =>
      super._value as ServerStateLoadListSuccess;

  @override
  $Res call({
    Object? servers = freezed,
  }) {
    return _then(ServerStateLoadListSuccess(
      servers == freezed
          ? _value.servers
          : servers // ignore: cast_nullable_to_non_nullable
              as List<Server>,
    ));
  }
}

/// @nodoc

class _$ServerStateLoadListSuccess implements ServerStateLoadListSuccess {
  const _$ServerStateLoadListSuccess(this.servers);

  @override
  final List<Server> servers;

  @override
  String toString() {
    return 'ServerState.loadListSuccess(servers: $servers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerStateLoadListSuccess &&
            const DeepCollectionEquality().equals(other.servers, servers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(servers));

  @JsonKey(ignore: true)
  @override
  $ServerStateLoadListSuccessCopyWith<ServerStateLoadListSuccess>
      get copyWith =>
          _$ServerStateLoadListSuccessCopyWithImpl<ServerStateLoadListSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Server> servers) loadListSuccess,
    required TResult Function(Server server) loadSelectedSuccess,
  }) {
    return loadListSuccess(servers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
  }) {
    return loadListSuccess?.call(servers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
    required TResult orElse(),
  }) {
    if (loadListSuccess != null) {
      return loadListSuccess(servers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateInitial value) initial,
    required TResult Function(ServerStateLoadListSuccess value) loadListSuccess,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadSelectedSuccess,
  }) {
    return loadListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
  }) {
    return loadListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
    required TResult orElse(),
  }) {
    if (loadListSuccess != null) {
      return loadListSuccess(this);
    }
    return orElse();
  }
}

abstract class ServerStateLoadListSuccess implements ServerState {
  const factory ServerStateLoadListSuccess(List<Server> servers) =
      _$ServerStateLoadListSuccess;

  List<Server> get servers;
  @JsonKey(ignore: true)
  $ServerStateLoadListSuccessCopyWith<ServerStateLoadListSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerStateLoadSelectedSuccessCopyWith<$Res> {
  factory $ServerStateLoadSelectedSuccessCopyWith(
          ServerStateLoadSelectedSuccess value,
          $Res Function(ServerStateLoadSelectedSuccess) then) =
      _$ServerStateLoadSelectedSuccessCopyWithImpl<$Res>;
  $Res call({Server server});
}

/// @nodoc
class _$ServerStateLoadSelectedSuccessCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res>
    implements $ServerStateLoadSelectedSuccessCopyWith<$Res> {
  _$ServerStateLoadSelectedSuccessCopyWithImpl(
      ServerStateLoadSelectedSuccess _value,
      $Res Function(ServerStateLoadSelectedSuccess) _then)
      : super(_value, (v) => _then(v as ServerStateLoadSelectedSuccess));

  @override
  ServerStateLoadSelectedSuccess get _value =>
      super._value as ServerStateLoadSelectedSuccess;

  @override
  $Res call({
    Object? server = freezed,
  }) {
    return _then(ServerStateLoadSelectedSuccess(
      server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server,
    ));
  }
}

/// @nodoc

class _$ServerStateLoadSelectedSuccess
    implements ServerStateLoadSelectedSuccess {
  const _$ServerStateLoadSelectedSuccess(this.server);

  @override
  final Server server;

  @override
  String toString() {
    return 'ServerState.loadSelectedSuccess(server: $server)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerStateLoadSelectedSuccess &&
            (identical(other.server, server) || other.server == server));
  }

  @override
  int get hashCode => Object.hash(runtimeType, server);

  @JsonKey(ignore: true)
  @override
  $ServerStateLoadSelectedSuccessCopyWith<ServerStateLoadSelectedSuccess>
      get copyWith => _$ServerStateLoadSelectedSuccessCopyWithImpl<
          ServerStateLoadSelectedSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Server> servers) loadListSuccess,
    required TResult Function(Server server) loadSelectedSuccess,
  }) {
    return loadSelectedSuccess(server);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
  }) {
    return loadSelectedSuccess?.call(server);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Server> servers)? loadListSuccess,
    TResult Function(Server server)? loadSelectedSuccess,
    required TResult orElse(),
  }) {
    if (loadSelectedSuccess != null) {
      return loadSelectedSuccess(server);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateInitial value) initial,
    required TResult Function(ServerStateLoadListSuccess value) loadListSuccess,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadSelectedSuccess,
  }) {
    return loadSelectedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
  }) {
    return loadSelectedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadListSuccess value)? loadListSuccess,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadSelectedSuccess,
    required TResult orElse(),
  }) {
    if (loadSelectedSuccess != null) {
      return loadSelectedSuccess(this);
    }
    return orElse();
  }
}

abstract class ServerStateLoadSelectedSuccess implements ServerState {
  const factory ServerStateLoadSelectedSuccess(Server server) =
      _$ServerStateLoadSelectedSuccess;

  Server get server;
  @JsonKey(ignore: true)
  $ServerStateLoadSelectedSuccessCopyWith<ServerStateLoadSelectedSuccess>
      get copyWith => throw _privateConstructorUsedError;
}
