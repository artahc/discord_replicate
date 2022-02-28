// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationStateTearOff {
  const _$NavigationStateTearOff();

  NavigationInitialState initialState() {
    return const NavigationInitialState();
  }
}

/// @nodoc
const $NavigationState = _$NavigationStateTearOff();

/// @nodoc
mixin _$NavigationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationInitialState value) initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationInitialState value)? initialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationInitialState value)? initialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;
}

/// @nodoc
abstract class $NavigationInitialStateCopyWith<$Res> {
  factory $NavigationInitialStateCopyWith(NavigationInitialState value,
          $Res Function(NavigationInitialState) then) =
      _$NavigationInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationInitialStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationInitialStateCopyWith<$Res> {
  _$NavigationInitialStateCopyWithImpl(NavigationInitialState _value,
      $Res Function(NavigationInitialState) _then)
      : super(_value, (v) => _then(v as NavigationInitialState));

  @override
  NavigationInitialState get _value => super._value as NavigationInitialState;
}

/// @nodoc

class _$NavigationInitialState implements NavigationInitialState {
  const _$NavigationInitialState();

  @override
  String toString() {
    return 'NavigationState.initialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NavigationInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavigationInitialState value) initialState,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NavigationInitialState value)? initialState,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavigationInitialState value)? initialState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class NavigationInitialState implements NavigationState {
  const factory NavigationInitialState() = _$NavigationInitialState;
}
