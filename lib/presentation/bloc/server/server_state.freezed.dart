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

  ServerStateError error(Exception e) {
    return ServerStateError(
      e,
    );
  }

  ServerStateLoading loading() {
    return const ServerStateLoading();
  }

  ServerStateLoaded loaded(Server server, Channel recentChannel) {
    return ServerStateLoaded(
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
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function(Server server, Channel recentChannel) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateError value) error,
    required TResult Function(ServerStateLoading value) loading,
    required TResult Function(ServerStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
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
abstract class $ServerStateErrorCopyWith<$Res> {
  factory $ServerStateErrorCopyWith(
          ServerStateError value, $Res Function(ServerStateError) then) =
      _$ServerStateErrorCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class _$ServerStateErrorCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res>
    implements $ServerStateErrorCopyWith<$Res> {
  _$ServerStateErrorCopyWithImpl(
      ServerStateError _value, $Res Function(ServerStateError) _then)
      : super(_value, (v) => _then(v as ServerStateError));

  @override
  ServerStateError get _value => super._value as ServerStateError;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(ServerStateError(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ServerStateError implements ServerStateError {
  const _$ServerStateError(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'ServerState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerStateError &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  $ServerStateErrorCopyWith<ServerStateError> get copyWith =>
      _$ServerStateErrorCopyWithImpl<ServerStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function(Server server, Channel recentChannel) loaded,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateError value) error,
    required TResult Function(ServerStateLoading value) loading,
    required TResult Function(ServerStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ServerStateError implements ServerState {
  const factory ServerStateError(Exception e) = _$ServerStateError;

  Exception get e;
  @JsonKey(ignore: true)
  $ServerStateErrorCopyWith<ServerStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerStateLoadingCopyWith<$Res> {
  factory $ServerStateLoadingCopyWith(
          ServerStateLoading value, $Res Function(ServerStateLoading) then) =
      _$ServerStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerStateLoadingCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res>
    implements $ServerStateLoadingCopyWith<$Res> {
  _$ServerStateLoadingCopyWithImpl(
      ServerStateLoading _value, $Res Function(ServerStateLoading) _then)
      : super(_value, (v) => _then(v as ServerStateLoading));

  @override
  ServerStateLoading get _value => super._value as ServerStateLoading;
}

/// @nodoc

class _$ServerStateLoading implements ServerStateLoading {
  const _$ServerStateLoading();

  @override
  String toString() {
    return 'ServerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function(Server server, Channel recentChannel) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateError value) error,
    required TResult Function(ServerStateLoading value) loading,
    required TResult Function(ServerStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ServerStateLoading implements ServerState {
  const factory ServerStateLoading() = _$ServerStateLoading;
}

/// @nodoc
abstract class $ServerStateLoadedCopyWith<$Res> {
  factory $ServerStateLoadedCopyWith(
          ServerStateLoaded value, $Res Function(ServerStateLoaded) then) =
      _$ServerStateLoadedCopyWithImpl<$Res>;
  $Res call({Server server, Channel recentChannel});

  $ServerCopyWith<$Res> get server;
  $ChannelCopyWith<$Res> get recentChannel;
}

/// @nodoc
class _$ServerStateLoadedCopyWithImpl<$Res>
    extends _$ServerStateCopyWithImpl<$Res>
    implements $ServerStateLoadedCopyWith<$Res> {
  _$ServerStateLoadedCopyWithImpl(
      ServerStateLoaded _value, $Res Function(ServerStateLoaded) _then)
      : super(_value, (v) => _then(v as ServerStateLoaded));

  @override
  ServerStateLoaded get _value => super._value as ServerStateLoaded;

  @override
  $Res call({
    Object? server = freezed,
    Object? recentChannel = freezed,
  }) {
    return _then(ServerStateLoaded(
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

  @override
  $ServerCopyWith<$Res> get server {
    return $ServerCopyWith<$Res>(_value.server, (value) {
      return _then(_value.copyWith(server: value));
    });
  }

  @override
  $ChannelCopyWith<$Res> get recentChannel {
    return $ChannelCopyWith<$Res>(_value.recentChannel, (value) {
      return _then(_value.copyWith(recentChannel: value));
    });
  }
}

/// @nodoc

class _$ServerStateLoaded implements ServerStateLoaded {
  const _$ServerStateLoaded(this.server, this.recentChannel);

  @override
  final Server server;
  @override
  final Channel recentChannel;

  @override
  String toString() {
    return 'ServerState.loaded(server: $server, recentChannel: $recentChannel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerStateLoaded &&
            const DeepCollectionEquality().equals(other.server, server) &&
            const DeepCollectionEquality()
                .equals(other.recentChannel, recentChannel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(server),
      const DeepCollectionEquality().hash(recentChannel));

  @JsonKey(ignore: true)
  @override
  $ServerStateLoadedCopyWith<ServerStateLoaded> get copyWith =>
      _$ServerStateLoadedCopyWithImpl<ServerStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception e) error,
    required TResult Function() loading,
    required TResult Function(Server server, Channel recentChannel) loaded,
  }) {
    return loaded(server, recentChannel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
  }) {
    return loaded?.call(server, recentChannel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception e)? error,
    TResult Function()? loading,
    TResult Function(Server server, Channel recentChannel)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(server, recentChannel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerStateError value) error,
    required TResult Function(ServerStateLoading value) loading,
    required TResult Function(ServerStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerStateError value)? error,
    TResult Function(ServerStateLoading value)? loading,
    TResult Function(ServerStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ServerStateLoaded implements ServerState {
  const factory ServerStateLoaded(Server server, Channel recentChannel) =
      _$ServerStateLoaded;

  Server get server;
  Channel get recentChannel;
  @JsonKey(ignore: true)
  $ServerStateLoadedCopyWith<ServerStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
