// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'channel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChannelStateTearOff {
  const _$ChannelStateTearOff();

  ChannelStateLoading loading() {
    return ChannelStateLoading();
  }

  ChannelStateError error(Exception e) {
    return ChannelStateError(
      e,
    );
  }

  ChannelStateLoaded loaded({required Channel channel}) {
    return ChannelStateLoaded(
      channel: channel,
    );
  }
}

/// @nodoc
const $ChannelState = _$ChannelStateTearOff();

/// @nodoc
mixin _$ChannelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(Channel channel) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateError value) error,
    required TResult Function(ChannelStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelStateCopyWith<$Res> {
  factory $ChannelStateCopyWith(
          ChannelState value, $Res Function(ChannelState) then) =
      _$ChannelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChannelStateCopyWithImpl<$Res> implements $ChannelStateCopyWith<$Res> {
  _$ChannelStateCopyWithImpl(this._value, this._then);

  final ChannelState _value;
  // ignore: unused_field
  final $Res Function(ChannelState) _then;
}

/// @nodoc
abstract class $ChannelStateLoadingCopyWith<$Res> {
  factory $ChannelStateLoadingCopyWith(
          ChannelStateLoading value, $Res Function(ChannelStateLoading) then) =
      _$ChannelStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChannelStateLoadingCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateLoadingCopyWith<$Res> {
  _$ChannelStateLoadingCopyWithImpl(
      ChannelStateLoading _value, $Res Function(ChannelStateLoading) _then)
      : super(_value, (v) => _then(v as ChannelStateLoading));

  @override
  ChannelStateLoading get _value => super._value as ChannelStateLoading;
}

/// @nodoc

class _$ChannelStateLoading implements ChannelStateLoading {
  _$ChannelStateLoading();

  @override
  String toString() {
    return 'ChannelState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChannelStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(Channel channel) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
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
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateError value) error,
    required TResult Function(ChannelStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChannelStateLoading implements ChannelState {
  factory ChannelStateLoading() = _$ChannelStateLoading;
}

/// @nodoc
abstract class $ChannelStateErrorCopyWith<$Res> {
  factory $ChannelStateErrorCopyWith(
          ChannelStateError value, $Res Function(ChannelStateError) then) =
      _$ChannelStateErrorCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class _$ChannelStateErrorCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateErrorCopyWith<$Res> {
  _$ChannelStateErrorCopyWithImpl(
      ChannelStateError _value, $Res Function(ChannelStateError) _then)
      : super(_value, (v) => _then(v as ChannelStateError));

  @override
  ChannelStateError get _value => super._value as ChannelStateError;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(ChannelStateError(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ChannelStateError implements ChannelStateError {
  _$ChannelStateError(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'ChannelState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelStateError &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  $ChannelStateErrorCopyWith<ChannelStateError> get copyWith =>
      _$ChannelStateErrorCopyWithImpl<ChannelStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(Channel channel) loaded,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
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
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateError value) error,
    required TResult Function(ChannelStateLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChannelStateError implements ChannelState {
  factory ChannelStateError(Exception e) = _$ChannelStateError;

  Exception get e;
  @JsonKey(ignore: true)
  $ChannelStateErrorCopyWith<ChannelStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelStateLoadedCopyWith<$Res> {
  factory $ChannelStateLoadedCopyWith(
          ChannelStateLoaded value, $Res Function(ChannelStateLoaded) then) =
      _$ChannelStateLoadedCopyWithImpl<$Res>;
  $Res call({Channel channel});

  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$ChannelStateLoadedCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateLoadedCopyWith<$Res> {
  _$ChannelStateLoadedCopyWithImpl(
      ChannelStateLoaded _value, $Res Function(ChannelStateLoaded) _then)
      : super(_value, (v) => _then(v as ChannelStateLoaded));

  @override
  ChannelStateLoaded get _value => super._value as ChannelStateLoaded;

  @override
  $Res call({
    Object? channel = freezed,
  }) {
    return _then(ChannelStateLoaded(
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel,
    ));
  }

  @override
  $ChannelCopyWith<$Res> get channel {
    return $ChannelCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value));
    });
  }
}

/// @nodoc

class _$ChannelStateLoaded implements ChannelStateLoaded {
  _$ChannelStateLoaded({required this.channel});

  @override
  final Channel channel;

  @override
  String toString() {
    return 'ChannelState.loaded(channel: $channel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelStateLoaded &&
            const DeepCollectionEquality().equals(other.channel, channel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(channel));

  @JsonKey(ignore: true)
  @override
  $ChannelStateLoadedCopyWith<ChannelStateLoaded> get copyWith =>
      _$ChannelStateLoadedCopyWithImpl<ChannelStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Exception e) error,
    required TResult Function(Channel channel) loaded,
  }) {
    return loaded(channel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
  }) {
    return loaded?.call(channel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Exception e)? error,
    TResult Function(Channel channel)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(channel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateError value) error,
    required TResult Function(ChannelStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateError value)? error,
    TResult Function(ChannelStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ChannelStateLoaded implements ChannelState {
  factory ChannelStateLoaded({required Channel channel}) = _$ChannelStateLoaded;

  Channel get channel;
  @JsonKey(ignore: true)
  $ChannelStateLoadedCopyWith<ChannelStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
