// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'direct_message_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DirectMessageEventTearOff {
  const _$DirectMessageEventTearOff();

  DirectMessageLoadRecent loadRecent() {
    return const DirectMessageLoadRecent();
  }
}

/// @nodoc
const $DirectMessageEvent = _$DirectMessageEventTearOff();

/// @nodoc
mixin _$DirectMessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRecent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageLoadRecent value) loadRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageLoadRecent value)? loadRecent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageLoadRecent value)? loadRecent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageEventCopyWith<$Res> {
  factory $DirectMessageEventCopyWith(
          DirectMessageEvent value, $Res Function(DirectMessageEvent) then) =
      _$DirectMessageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageEventCopyWithImpl<$Res>
    implements $DirectMessageEventCopyWith<$Res> {
  _$DirectMessageEventCopyWithImpl(this._value, this._then);

  final DirectMessageEvent _value;
  // ignore: unused_field
  final $Res Function(DirectMessageEvent) _then;
}

/// @nodoc
abstract class $DirectMessageLoadRecentCopyWith<$Res> {
  factory $DirectMessageLoadRecentCopyWith(DirectMessageLoadRecent value,
          $Res Function(DirectMessageLoadRecent) then) =
      _$DirectMessageLoadRecentCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageLoadRecentCopyWithImpl<$Res>
    extends _$DirectMessageEventCopyWithImpl<$Res>
    implements $DirectMessageLoadRecentCopyWith<$Res> {
  _$DirectMessageLoadRecentCopyWithImpl(DirectMessageLoadRecent _value,
      $Res Function(DirectMessageLoadRecent) _then)
      : super(_value, (v) => _then(v as DirectMessageLoadRecent));

  @override
  DirectMessageLoadRecent get _value => super._value as DirectMessageLoadRecent;
}

/// @nodoc

class _$DirectMessageLoadRecent implements DirectMessageLoadRecent {
  const _$DirectMessageLoadRecent();

  @override
  String toString() {
    return 'DirectMessageEvent.loadRecent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DirectMessageLoadRecent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRecent,
  }) {
    return loadRecent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadRecent,
  }) {
    return loadRecent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRecent,
    required TResult orElse(),
  }) {
    if (loadRecent != null) {
      return loadRecent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageLoadRecent value) loadRecent,
  }) {
    return loadRecent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageLoadRecent value)? loadRecent,
  }) {
    return loadRecent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageLoadRecent value)? loadRecent,
    required TResult orElse(),
  }) {
    if (loadRecent != null) {
      return loadRecent(this);
    }
    return orElse();
  }
}

abstract class DirectMessageLoadRecent implements DirectMessageEvent {
  const factory DirectMessageLoadRecent() = _$DirectMessageLoadRecent;
}
