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

  ChannelStateInitial initial() {
    return const ChannelStateInitial();
  }

  ChannelStateLoadInProgress loadInProgress() {
    return const ChannelStateLoadInProgress();
  }

  ChannelStateLoadFailed loadFailed(Exception e) {
    return ChannelStateLoadFailed(
      e,
    );
  }

  ChannelStateLoadSuccess loadSuccess(Channel channel) {
    return ChannelStateLoadSuccess(
      channel,
    );
  }
}

/// @nodoc
const $ChannelState = _$ChannelStateTearOff();

/// @nodoc
mixin _$ChannelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Exception e) loadFailed,
    required TResult Function(Channel channel) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateInitial value) initial,
    required TResult Function(ChannelStateLoadInProgress value) loadInProgress,
    required TResult Function(ChannelStateLoadFailed value) loadFailed,
    required TResult Function(ChannelStateLoadSuccess value) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
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
abstract class $ChannelStateInitialCopyWith<$Res> {
  factory $ChannelStateInitialCopyWith(
          ChannelStateInitial value, $Res Function(ChannelStateInitial) then) =
      _$ChannelStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChannelStateInitialCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateInitialCopyWith<$Res> {
  _$ChannelStateInitialCopyWithImpl(
      ChannelStateInitial _value, $Res Function(ChannelStateInitial) _then)
      : super(_value, (v) => _then(v as ChannelStateInitial));

  @override
  ChannelStateInitial get _value => super._value as ChannelStateInitial;
}

/// @nodoc

class _$ChannelStateInitial implements ChannelStateInitial {
  const _$ChannelStateInitial();

  @override
  String toString() {
    return 'ChannelState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChannelStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Exception e) loadFailed,
    required TResult Function(Channel channel) loadSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
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
    required TResult Function(ChannelStateInitial value) initial,
    required TResult Function(ChannelStateLoadInProgress value) loadInProgress,
    required TResult Function(ChannelStateLoadFailed value) loadFailed,
    required TResult Function(ChannelStateLoadSuccess value) loadSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChannelStateInitial implements ChannelState {
  const factory ChannelStateInitial() = _$ChannelStateInitial;
}

/// @nodoc
abstract class $ChannelStateLoadInProgressCopyWith<$Res> {
  factory $ChannelStateLoadInProgressCopyWith(ChannelStateLoadInProgress value,
          $Res Function(ChannelStateLoadInProgress) then) =
      _$ChannelStateLoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChannelStateLoadInProgressCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateLoadInProgressCopyWith<$Res> {
  _$ChannelStateLoadInProgressCopyWithImpl(ChannelStateLoadInProgress _value,
      $Res Function(ChannelStateLoadInProgress) _then)
      : super(_value, (v) => _then(v as ChannelStateLoadInProgress));

  @override
  ChannelStateLoadInProgress get _value =>
      super._value as ChannelStateLoadInProgress;
}

/// @nodoc

class _$ChannelStateLoadInProgress implements ChannelStateLoadInProgress {
  const _$ChannelStateLoadInProgress();

  @override
  String toString() {
    return 'ChannelState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelStateLoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Exception e) loadFailed,
    required TResult Function(Channel channel) loadSuccess,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateInitial value) initial,
    required TResult Function(ChannelStateLoadInProgress value) loadInProgress,
    required TResult Function(ChannelStateLoadFailed value) loadFailed,
    required TResult Function(ChannelStateLoadSuccess value) loadSuccess,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class ChannelStateLoadInProgress implements ChannelState {
  const factory ChannelStateLoadInProgress() = _$ChannelStateLoadInProgress;
}

/// @nodoc
abstract class $ChannelStateLoadFailedCopyWith<$Res> {
  factory $ChannelStateLoadFailedCopyWith(ChannelStateLoadFailed value,
          $Res Function(ChannelStateLoadFailed) then) =
      _$ChannelStateLoadFailedCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class _$ChannelStateLoadFailedCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateLoadFailedCopyWith<$Res> {
  _$ChannelStateLoadFailedCopyWithImpl(ChannelStateLoadFailed _value,
      $Res Function(ChannelStateLoadFailed) _then)
      : super(_value, (v) => _then(v as ChannelStateLoadFailed));

  @override
  ChannelStateLoadFailed get _value => super._value as ChannelStateLoadFailed;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(ChannelStateLoadFailed(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ChannelStateLoadFailed implements ChannelStateLoadFailed {
  const _$ChannelStateLoadFailed(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'ChannelState.loadFailed(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelStateLoadFailed &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  $ChannelStateLoadFailedCopyWith<ChannelStateLoadFailed> get copyWith =>
      _$ChannelStateLoadFailedCopyWithImpl<ChannelStateLoadFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Exception e) loadFailed,
    required TResult Function(Channel channel) loadSuccess,
  }) {
    return loadFailed(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
  }) {
    return loadFailed?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateInitial value) initial,
    required TResult Function(ChannelStateLoadInProgress value) loadInProgress,
    required TResult Function(ChannelStateLoadFailed value) loadFailed,
    required TResult Function(ChannelStateLoadSuccess value) loadSuccess,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class ChannelStateLoadFailed implements ChannelState {
  const factory ChannelStateLoadFailed(Exception e) = _$ChannelStateLoadFailed;

  Exception get e;
  @JsonKey(ignore: true)
  $ChannelStateLoadFailedCopyWith<ChannelStateLoadFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelStateLoadSuccessCopyWith<$Res> {
  factory $ChannelStateLoadSuccessCopyWith(ChannelStateLoadSuccess value,
          $Res Function(ChannelStateLoadSuccess) then) =
      _$ChannelStateLoadSuccessCopyWithImpl<$Res>;
  $Res call({Channel channel});

  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$ChannelStateLoadSuccessCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res>
    implements $ChannelStateLoadSuccessCopyWith<$Res> {
  _$ChannelStateLoadSuccessCopyWithImpl(ChannelStateLoadSuccess _value,
      $Res Function(ChannelStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as ChannelStateLoadSuccess));

  @override
  ChannelStateLoadSuccess get _value => super._value as ChannelStateLoadSuccess;

  @override
  $Res call({
    Object? channel = freezed,
  }) {
    return _then(ChannelStateLoadSuccess(
      channel == freezed
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

class _$ChannelStateLoadSuccess implements ChannelStateLoadSuccess {
  const _$ChannelStateLoadSuccess(this.channel);

  @override
  final Channel channel;

  @override
  String toString() {
    return 'ChannelState.loadSuccess(channel: $channel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelStateLoadSuccess &&
            const DeepCollectionEquality().equals(other.channel, channel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(channel));

  @JsonKey(ignore: true)
  @override
  $ChannelStateLoadSuccessCopyWith<ChannelStateLoadSuccess> get copyWith =>
      _$ChannelStateLoadSuccessCopyWithImpl<ChannelStateLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Exception e) loadFailed,
    required TResult Function(Channel channel) loadSuccess,
  }) {
    return loadSuccess(channel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
  }) {
    return loadSuccess?.call(channel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Exception e)? loadFailed,
    TResult Function(Channel channel)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(channel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelStateInitial value) initial,
    required TResult Function(ChannelStateLoadInProgress value) loadInProgress,
    required TResult Function(ChannelStateLoadFailed value) loadFailed,
    required TResult Function(ChannelStateLoadSuccess value) loadSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelStateInitial value)? initial,
    TResult Function(ChannelStateLoadInProgress value)? loadInProgress,
    TResult Function(ChannelStateLoadFailed value)? loadFailed,
    TResult Function(ChannelStateLoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class ChannelStateLoadSuccess implements ChannelState {
  const factory ChannelStateLoadSuccess(Channel channel) =
      _$ChannelStateLoadSuccess;

  Channel get channel;
  @JsonKey(ignore: true)
  $ChannelStateLoadSuccessCopyWith<ChannelStateLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
