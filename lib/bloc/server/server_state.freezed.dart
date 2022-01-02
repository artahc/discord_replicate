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

  ServerStateLoadServerInProgress loadServerInProgress() {
    return const ServerStateLoadServerInProgress();
  }

  ServerStateLoadSelectedSuccess loadServerSuccess(
      Server server, Channel recentChannel) {
    return ServerStateLoadSelectedSuccess(
      server,
      recentChannel,
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
    required TResult Function() loadServerInProgress,
    required TResult Function(Server server, Channel recentChannel)
        loadServerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateInitial value) initial,
    required TResult Function(ServerStateLoadServerInProgress value)
        loadServerInProgress,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadServerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
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
    required TResult Function() loadServerInProgress,
    required TResult Function(Server server, Channel recentChannel)
        loadServerSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
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
    required TResult Function(ServerStateLoadServerInProgress value)
        loadServerInProgress,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadServerSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
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
abstract class $ServerStateLoadServerInProgressCopyWith<$Res> {
  factory $ServerStateLoadServerInProgressCopyWith(
          ServerStateLoadServerInProgress value,
          $Res Function(ServerStateLoadServerInProgress) then) =
      _$ServerStateLoadServerInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerStateLoadServerInProgressCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res>
    implements $ServerStateLoadServerInProgressCopyWith<$Res> {
  _$ServerStateLoadServerInProgressCopyWithImpl(
      ServerStateLoadServerInProgress _value,
      $Res Function(ServerStateLoadServerInProgress) _then)
      : super(_value, (v) => _then(v as ServerStateLoadServerInProgress));

  @override
  ServerStateLoadServerInProgress get _value =>
      super._value as ServerStateLoadServerInProgress;
}

/// @nodoc

class _$ServerStateLoadServerInProgress
    implements ServerStateLoadServerInProgress {
  const _$ServerStateLoadServerInProgress();

  @override
  String toString() {
    return 'ServerState.loadServerInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerStateLoadServerInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadServerInProgress,
    required TResult Function(Server server, Channel recentChannel)
        loadServerSuccess,
  }) {
    return loadServerInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
  }) {
    return loadServerInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
    required TResult orElse(),
  }) {
    if (loadServerInProgress != null) {
      return loadServerInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateInitial value) initial,
    required TResult Function(ServerStateLoadServerInProgress value)
        loadServerInProgress,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadServerSuccess,
  }) {
    return loadServerInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
  }) {
    return loadServerInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
    required TResult orElse(),
  }) {
    if (loadServerInProgress != null) {
      return loadServerInProgress(this);
    }
    return orElse();
  }
}

abstract class ServerStateLoadServerInProgress implements ServerState {
  const factory ServerStateLoadServerInProgress() =
      _$ServerStateLoadServerInProgress;
}

/// @nodoc
abstract class $ServerStateLoadSelectedSuccessCopyWith<$Res> {
  factory $ServerStateLoadSelectedSuccessCopyWith(
          ServerStateLoadSelectedSuccess value,
          $Res Function(ServerStateLoadSelectedSuccess) then) =
      _$ServerStateLoadSelectedSuccessCopyWithImpl<$Res>;
  $Res call({Server server, Channel recentChannel});
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
    Object? recentChannel = freezed,
  }) {
    return _then(ServerStateLoadSelectedSuccess(
      server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server,
      recentChannel == freezed
          ? _value.recentChannel
          : recentChannel // ignore: cast_nullable_to_non_nullable
              as Channel,
    ));
  }
}

/// @nodoc

class _$ServerStateLoadSelectedSuccess
    implements ServerStateLoadSelectedSuccess {
  const _$ServerStateLoadSelectedSuccess(this.server, this.recentChannel);

  @override
  final Server server;
  @override
  final Channel recentChannel;

  @override
  String toString() {
    return 'ServerState.loadServerSuccess(server: $server, recentChannel: $recentChannel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerStateLoadSelectedSuccess &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.recentChannel, recentChannel) ||
                other.recentChannel == recentChannel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, server, recentChannel);

  @JsonKey(ignore: true)
  @override
  $ServerStateLoadSelectedSuccessCopyWith<ServerStateLoadSelectedSuccess>
      get copyWith => _$ServerStateLoadSelectedSuccessCopyWithImpl<
          ServerStateLoadSelectedSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadServerInProgress,
    required TResult Function(Server server, Channel recentChannel)
        loadServerSuccess,
  }) {
    return loadServerSuccess(server, recentChannel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
  }) {
    return loadServerSuccess?.call(server, recentChannel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadServerInProgress,
    TResult Function(Server server, Channel recentChannel)? loadServerSuccess,
    required TResult orElse(),
  }) {
    if (loadServerSuccess != null) {
      return loadServerSuccess(server, recentChannel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateInitial value) initial,
    required TResult Function(ServerStateLoadServerInProgress value)
        loadServerInProgress,
    required TResult Function(ServerStateLoadSelectedSuccess value)
        loadServerSuccess,
  }) {
    return loadServerSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
  }) {
    return loadServerSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateInitial value)? initial,
    TResult Function(ServerStateLoadServerInProgress value)?
        loadServerInProgress,
    TResult Function(ServerStateLoadSelectedSuccess value)? loadServerSuccess,
    required TResult orElse(),
  }) {
    if (loadServerSuccess != null) {
      return loadServerSuccess(this);
    }
    return orElse();
  }
}

abstract class ServerStateLoadSelectedSuccess implements ServerState {
  const factory ServerStateLoadSelectedSuccess(
      Server server, Channel recentChannel) = _$ServerStateLoadSelectedSuccess;

  Server get server;
  Channel get recentChannel;
  @JsonKey(ignore: true)
  $ServerStateLoadSelectedSuccessCopyWith<ServerStateLoadSelectedSuccess>
      get copyWith => throw _privateConstructorUsedError;
}
