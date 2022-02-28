// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'channel_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChannelEventTearOff {
  const _$ChannelEventTearOff();

  ChannelEventLoad load(String id) {
    return ChannelEventLoad(
      id,
    );
  }
}

/// @nodoc
const $ChannelEvent = _$ChannelEventTearOff();

/// @nodoc
mixin _$ChannelEvent {
  String get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelEventLoad value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelEventLoad value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelEventLoad value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChannelEventCopyWith<ChannelEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelEventCopyWith<$Res> {
  factory $ChannelEventCopyWith(
          ChannelEvent value, $Res Function(ChannelEvent) then) =
      _$ChannelEventCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$ChannelEventCopyWithImpl<$Res> implements $ChannelEventCopyWith<$Res> {
  _$ChannelEventCopyWithImpl(this._value, this._then);

  final ChannelEvent _value;
  // ignore: unused_field
  final $Res Function(ChannelEvent) _then;

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
abstract class $ChannelEventLoadCopyWith<$Res>
    implements $ChannelEventCopyWith<$Res> {
  factory $ChannelEventLoadCopyWith(
          ChannelEventLoad value, $Res Function(ChannelEventLoad) then) =
      _$ChannelEventLoadCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class _$ChannelEventLoadCopyWithImpl<$Res>
    extends _$ChannelEventCopyWithImpl<$Res>
    implements $ChannelEventLoadCopyWith<$Res> {
  _$ChannelEventLoadCopyWithImpl(
      ChannelEventLoad _value, $Res Function(ChannelEventLoad) _then)
      : super(_value, (v) => _then(v as ChannelEventLoad));

  @override
  ChannelEventLoad get _value => super._value as ChannelEventLoad;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(ChannelEventLoad(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChannelEventLoad implements ChannelEventLoad {
  const _$ChannelEventLoad(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ChannelEvent.load(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelEventLoad &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  $ChannelEventLoadCopyWith<ChannelEventLoad> get copyWith =>
      _$ChannelEventLoadCopyWithImpl<ChannelEventLoad>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? load,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChannelEventLoad value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChannelEventLoad value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChannelEventLoad value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class ChannelEventLoad implements ChannelEvent {
  const factory ChannelEventLoad(String id) = _$ChannelEventLoad;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  $ChannelEventLoadCopyWith<ChannelEventLoad> get copyWith =>
      throw _privateConstructorUsedError;
}
