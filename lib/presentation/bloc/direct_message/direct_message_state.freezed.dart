// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'direct_message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DirectMessageStateTearOff {
  const _$DirectMessageStateTearOff();

  DirectMessageStateEmpty empty() {
    return const DirectMessageStateEmpty();
  }

  DirectMessageLoading loading() {
    return const DirectMessageLoading();
  }

  DirectMessageStateLoaded loaded(Channel channel) {
    return DirectMessageStateLoaded(
      channel,
    );
  }
}

/// @nodoc
const $DirectMessageState = _$DirectMessageStateTearOff();

/// @nodoc
mixin _$DirectMessageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageStateEmpty value) empty,
    required TResult Function(DirectMessageLoading value) loading,
    required TResult Function(DirectMessageStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageStateCopyWith<$Res> {
  factory $DirectMessageStateCopyWith(
          DirectMessageState value, $Res Function(DirectMessageState) then) =
      _$DirectMessageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateCopyWith<$Res> {
  _$DirectMessageStateCopyWithImpl(this._value, this._then);

  final DirectMessageState _value;
  // ignore: unused_field
  final $Res Function(DirectMessageState) _then;
}

/// @nodoc
abstract class $DirectMessageStateEmptyCopyWith<$Res> {
  factory $DirectMessageStateEmptyCopyWith(DirectMessageStateEmpty value,
          $Res Function(DirectMessageStateEmpty) then) =
      _$DirectMessageStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageStateEmptyCopyWithImpl<$Res>
    extends _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateEmptyCopyWith<$Res> {
  _$DirectMessageStateEmptyCopyWithImpl(DirectMessageStateEmpty _value,
      $Res Function(DirectMessageStateEmpty) _then)
      : super(_value, (v) => _then(v as DirectMessageStateEmpty));

  @override
  DirectMessageStateEmpty get _value => super._value as DirectMessageStateEmpty;
}

/// @nodoc

class _$DirectMessageStateEmpty implements DirectMessageStateEmpty {
  const _$DirectMessageStateEmpty();

  @override
  String toString() {
    return 'DirectMessageState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DirectMessageStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
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
    required TResult Function(DirectMessageStateEmpty value) empty,
    required TResult Function(DirectMessageLoading value) loading,
    required TResult Function(DirectMessageStateLoaded value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class DirectMessageStateEmpty implements DirectMessageState {
  const factory DirectMessageStateEmpty() = _$DirectMessageStateEmpty;
}

/// @nodoc
abstract class $DirectMessageLoadingCopyWith<$Res> {
  factory $DirectMessageLoadingCopyWith(DirectMessageLoading value,
          $Res Function(DirectMessageLoading) then) =
      _$DirectMessageLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageLoadingCopyWithImpl<$Res>
    extends _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageLoadingCopyWith<$Res> {
  _$DirectMessageLoadingCopyWithImpl(
      DirectMessageLoading _value, $Res Function(DirectMessageLoading) _then)
      : super(_value, (v) => _then(v as DirectMessageLoading));

  @override
  DirectMessageLoading get _value => super._value as DirectMessageLoading;
}

/// @nodoc

class _$DirectMessageLoading implements DirectMessageLoading {
  const _$DirectMessageLoading();

  @override
  String toString() {
    return 'DirectMessageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DirectMessageLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
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
    required TResult Function(DirectMessageStateEmpty value) empty,
    required TResult Function(DirectMessageLoading value) loading,
    required TResult Function(DirectMessageStateLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DirectMessageLoading implements DirectMessageState {
  const factory DirectMessageLoading() = _$DirectMessageLoading;
}

/// @nodoc
abstract class $DirectMessageStateLoadedCopyWith<$Res> {
  factory $DirectMessageStateLoadedCopyWith(DirectMessageStateLoaded value,
          $Res Function(DirectMessageStateLoaded) then) =
      _$DirectMessageStateLoadedCopyWithImpl<$Res>;
  $Res call({Channel channel});

  $ChannelCopyWith<$Res> get channel;
}

/// @nodoc
class _$DirectMessageStateLoadedCopyWithImpl<$Res>
    extends _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateLoadedCopyWith<$Res> {
  _$DirectMessageStateLoadedCopyWithImpl(DirectMessageStateLoaded _value,
      $Res Function(DirectMessageStateLoaded) _then)
      : super(_value, (v) => _then(v as DirectMessageStateLoaded));

  @override
  DirectMessageStateLoaded get _value =>
      super._value as DirectMessageStateLoaded;

  @override
  $Res call({
    Object? channel = freezed,
  }) {
    return _then(DirectMessageStateLoaded(
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

class _$DirectMessageStateLoaded implements DirectMessageStateLoaded {
  const _$DirectMessageStateLoaded(this.channel);

  @override
  final Channel channel;

  @override
  String toString() {
    return 'DirectMessageState.loaded(channel: $channel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirectMessageStateLoaded &&
            const DeepCollectionEquality().equals(other.channel, channel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(channel));

  @JsonKey(ignore: true)
  @override
  $DirectMessageStateLoadedCopyWith<DirectMessageStateLoaded> get copyWith =>
      _$DirectMessageStateLoadedCopyWithImpl<DirectMessageStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Channel channel) loaded,
  }) {
    return loaded(channel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Channel channel)? loaded,
  }) {
    return loaded?.call(channel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
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
    required TResult Function(DirectMessageStateEmpty value) empty,
    required TResult Function(DirectMessageLoading value) loading,
    required TResult Function(DirectMessageStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateEmpty value)? empty,
    TResult Function(DirectMessageLoading value)? loading,
    TResult Function(DirectMessageStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DirectMessageStateLoaded implements DirectMessageState {
  const factory DirectMessageStateLoaded(Channel channel) =
      _$DirectMessageStateLoaded;

  Channel get channel;
  @JsonKey(ignore: true)
  $DirectMessageStateLoadedCopyWith<DirectMessageStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
