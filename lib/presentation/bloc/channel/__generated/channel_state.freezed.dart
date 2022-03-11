// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../channel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChannelStateTearOff {
  const _$ChannelStateTearOff();

  ChannelStateEmpty empty() {
    return ChannelStateEmpty();
  }

  ChannelStateLoading loading() {
    return ChannelStateLoading();
  }

  ChannelStateLoaded loaded({required Channel channel}) {
    return ChannelStateLoaded(
      channel: channel,
    );
  }

  ChannelStateError error(Exception exception, StackTrace stackTrace) {
    return ChannelStateError(
      exception,
      stackTrace,
    );
  }
}

/// @nodoc
const $ChannelState = _$ChannelStateTearOff();

/// @nodoc
mixin _$ChannelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
    required TResult Function(Exception exception, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateEmpty value) empty,
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateLoaded value) loaded,
    required TResult Function(ChannelStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
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
abstract class $ChannelStateEmptyCopyWith<$Res> {
  factory $ChannelStateEmptyCopyWith(
          ChannelStateEmpty value, $Res Function(ChannelStateEmpty) then) =
      _$ChannelStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChannelStateEmptyCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateEmptyCopyWith<$Res> {
  _$ChannelStateEmptyCopyWithImpl(
      ChannelStateEmpty _value, $Res Function(ChannelStateEmpty) _then)
      : super(_value, (v) => _then(v as ChannelStateEmpty));

  @override
  ChannelStateEmpty get _value => super._value as ChannelStateEmpty;
}

/// @nodoc

class _$ChannelStateEmpty implements ChannelStateEmpty {
  _$ChannelStateEmpty();

  @override
  String toString() {
    return 'ChannelState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChannelStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
    required TResult Function(Exception exception, StackTrace stackTrace) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateEmpty value) empty,
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateLoaded value) loaded,
    required TResult Function(ChannelStateError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ChannelStateEmpty implements ChannelState {
  factory ChannelStateEmpty() = _$ChannelStateEmpty;
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
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
    required TResult Function(Exception exception, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
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
    required TResult Function(ChannelStateEmpty value) empty,
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateLoaded value) loaded,
    required TResult Function(ChannelStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
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
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
    required TResult Function(Exception exception, StackTrace stackTrace) error,
  }) {
    return loaded(channel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
  }) {
    return loaded?.call(channel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
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
    required TResult Function(ChannelStateEmpty value) empty,
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateLoaded value) loaded,
    required TResult Function(ChannelStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
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

/// @nodoc
abstract class $ChannelStateErrorCopyWith<$Res> {
  factory $ChannelStateErrorCopyWith(
          ChannelStateError value, $Res Function(ChannelStateError) then) =
      _$ChannelStateErrorCopyWithImpl<$Res>;
  $Res call({Exception exception, StackTrace stackTrace});
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
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(ChannelStateError(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ChannelStateError implements ChannelStateError {
  _$ChannelStateError(this.exception, this.stackTrace);

  @override
  final Exception exception;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ChannelState.error(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelStateError &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(exception),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  $ChannelStateErrorCopyWith<ChannelStateError> get copyWith =>
      _$ChannelStateErrorCopyWithImpl<ChannelStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
    required TResult Function(Exception exception, StackTrace stackTrace) error,
  }) {
    return error(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
  }) {
    return error?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    TResult Function(Exception exception, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateEmpty value) empty,
    required TResult Function(ChannelStateLoading value) loading,
    required TResult Function(ChannelStateLoaded value) loaded,
    required TResult Function(ChannelStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateEmpty value)? empty,
    TResult Function(ChannelStateLoading value)? loading,
    TResult Function(ChannelStateLoaded value)? loaded,
    TResult Function(ChannelStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChannelStateError implements ChannelState {
  factory ChannelStateError(Exception exception, StackTrace stackTrace) =
      _$ChannelStateError;

  Exception get exception;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  $ChannelStateErrorCopyWith<ChannelStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
