// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationEventTearOff {
  const _$NavigationEventTearOff();

  InitialEvent initialEvent() {
    return const InitialEvent();
  }

  Push push(BuildContext context, Route<dynamic> route, bool useRoot) {
    return Push(
      context,
      route,
      useRoot,
    );
  }

  PushNamed pushNamed(BuildContext context, String route, bool useRoot) {
    return PushNamed(
      context,
      route,
      useRoot,
    );
  }

  PushNamedAndRemoveUntil pushNamedAndRemoveUntil(BuildContext context,
      String route, bool Function(Route<dynamic>) predicate, bool useRoot) {
    return PushNamedAndRemoveUntil(
      context,
      route,
      predicate,
      useRoot,
    );
  }

  Pop pop(BuildContext context, bool useRoot) {
    return Pop(
      context,
      useRoot,
    );
  }
}

/// @nodoc
const $NavigationEvent = _$NavigationEventTearOff();

/// @nodoc
mixin _$NavigationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(
            BuildContext context, Route<dynamic> route, bool useRoot)
        push,
    required TResult Function(BuildContext context, String route, bool useRoot)
        pushNamed,
    required TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)
        pushNamedAndRemoveUntil,
    required TResult Function(BuildContext context, bool useRoot) pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(Push value) push,
    required TResult Function(PushNamed value) pushNamed,
    required TResult Function(PushNamedAndRemoveUntil value)
        pushNamedAndRemoveUntil,
    required TResult Function(Pop value) pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationEventCopyWith<$Res> {
  factory $NavigationEventCopyWith(
          NavigationEvent value, $Res Function(NavigationEvent) then) =
      _$NavigationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationEventCopyWithImpl<$Res>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  final NavigationEvent _value;
  // ignore: unused_field
  final $Res Function(NavigationEvent) _then;
}

/// @nodoc
abstract class $InitialEventCopyWith<$Res> {
  factory $InitialEventCopyWith(
          InitialEvent value, $Res Function(InitialEvent) then) =
      _$InitialEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialEventCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $InitialEventCopyWith<$Res> {
  _$InitialEventCopyWithImpl(
      InitialEvent _value, $Res Function(InitialEvent) _then)
      : super(_value, (v) => _then(v as InitialEvent));

  @override
  InitialEvent get _value => super._value as InitialEvent;
}

/// @nodoc

class _$InitialEvent implements InitialEvent {
  const _$InitialEvent();

  @override
  String toString() {
    return 'NavigationEvent.initialEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(
            BuildContext context, Route<dynamic> route, bool useRoot)
        push,
    required TResult Function(BuildContext context, String route, bool useRoot)
        pushNamed,
    required TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)
        pushNamedAndRemoveUntil,
    required TResult Function(BuildContext context, bool useRoot) pop,
  }) {
    return initialEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
  }) {
    return initialEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
    required TResult orElse(),
  }) {
    if (initialEvent != null) {
      return initialEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(Push value) push,
    required TResult Function(PushNamed value) pushNamed,
    required TResult Function(PushNamedAndRemoveUntil value)
        pushNamedAndRemoveUntil,
    required TResult Function(Pop value) pop,
  }) {
    return initialEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
  }) {
    return initialEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) {
    if (initialEvent != null) {
      return initialEvent(this);
    }
    return orElse();
  }
}

abstract class InitialEvent implements NavigationEvent {
  const factory InitialEvent() = _$InitialEvent;
}

/// @nodoc
abstract class $PushCopyWith<$Res> {
  factory $PushCopyWith(Push value, $Res Function(Push) then) =
      _$PushCopyWithImpl<$Res>;
  $Res call({BuildContext context, Route<dynamic> route, bool useRoot});
}

/// @nodoc
class _$PushCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $PushCopyWith<$Res> {
  _$PushCopyWithImpl(Push _value, $Res Function(Push) _then)
      : super(_value, (v) => _then(v as Push));

  @override
  Push get _value => super._value as Push;

  @override
  $Res call({
    Object? context = freezed,
    Object? route = freezed,
    Object? useRoot = freezed,
  }) {
    return _then(Push(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route<dynamic>,
      useRoot == freezed
          ? _value.useRoot
          : useRoot // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Push implements Push {
  const _$Push(this.context, this.route, this.useRoot);

  @override
  final BuildContext context;
  @override
  final Route<dynamic> route;
  @override
  final bool useRoot;

  @override
  String toString() {
    return 'NavigationEvent.push(context: $context, route: $route, useRoot: $useRoot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Push &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.useRoot, useRoot) || other.useRoot == useRoot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, route, useRoot);

  @JsonKey(ignore: true)
  @override
  $PushCopyWith<Push> get copyWith =>
      _$PushCopyWithImpl<Push>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(
            BuildContext context, Route<dynamic> route, bool useRoot)
        push,
    required TResult Function(BuildContext context, String route, bool useRoot)
        pushNamed,
    required TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)
        pushNamedAndRemoveUntil,
    required TResult Function(BuildContext context, bool useRoot) pop,
  }) {
    return push(context, route, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
  }) {
    return push?.call(context, route, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
    required TResult orElse(),
  }) {
    if (push != null) {
      return push(context, route, useRoot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(Push value) push,
    required TResult Function(PushNamed value) pushNamed,
    required TResult Function(PushNamedAndRemoveUntil value)
        pushNamedAndRemoveUntil,
    required TResult Function(Pop value) pop,
  }) {
    return push(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
  }) {
    return push?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) {
    if (push != null) {
      return push(this);
    }
    return orElse();
  }
}

abstract class Push implements NavigationEvent {
  const factory Push(BuildContext context, Route<dynamic> route, bool useRoot) =
      _$Push;

  BuildContext get context;
  Route<dynamic> get route;
  bool get useRoot;
  @JsonKey(ignore: true)
  $PushCopyWith<Push> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNamedCopyWith<$Res> {
  factory $PushNamedCopyWith(PushNamed value, $Res Function(PushNamed) then) =
      _$PushNamedCopyWithImpl<$Res>;
  $Res call({BuildContext context, String route, bool useRoot});
}

/// @nodoc
class _$PushNamedCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $PushNamedCopyWith<$Res> {
  _$PushNamedCopyWithImpl(PushNamed _value, $Res Function(PushNamed) _then)
      : super(_value, (v) => _then(v as PushNamed));

  @override
  PushNamed get _value => super._value as PushNamed;

  @override
  $Res call({
    Object? context = freezed,
    Object? route = freezed,
    Object? useRoot = freezed,
  }) {
    return _then(PushNamed(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      useRoot == freezed
          ? _value.useRoot
          : useRoot // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PushNamed implements PushNamed {
  const _$PushNamed(this.context, this.route, this.useRoot);

  @override
  final BuildContext context;
  @override
  final String route;
  @override
  final bool useRoot;

  @override
  String toString() {
    return 'NavigationEvent.pushNamed(context: $context, route: $route, useRoot: $useRoot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PushNamed &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.useRoot, useRoot) || other.useRoot == useRoot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, route, useRoot);

  @JsonKey(ignore: true)
  @override
  $PushNamedCopyWith<PushNamed> get copyWith =>
      _$PushNamedCopyWithImpl<PushNamed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(
            BuildContext context, Route<dynamic> route, bool useRoot)
        push,
    required TResult Function(BuildContext context, String route, bool useRoot)
        pushNamed,
    required TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)
        pushNamedAndRemoveUntil,
    required TResult Function(BuildContext context, bool useRoot) pop,
  }) {
    return pushNamed(context, route, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
  }) {
    return pushNamed?.call(context, route, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
    required TResult orElse(),
  }) {
    if (pushNamed != null) {
      return pushNamed(context, route, useRoot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(Push value) push,
    required TResult Function(PushNamed value) pushNamed,
    required TResult Function(PushNamedAndRemoveUntil value)
        pushNamedAndRemoveUntil,
    required TResult Function(Pop value) pop,
  }) {
    return pushNamed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
  }) {
    return pushNamed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) {
    if (pushNamed != null) {
      return pushNamed(this);
    }
    return orElse();
  }
}

abstract class PushNamed implements NavigationEvent {
  const factory PushNamed(BuildContext context, String route, bool useRoot) =
      _$PushNamed;

  BuildContext get context;
  String get route;
  bool get useRoot;
  @JsonKey(ignore: true)
  $PushNamedCopyWith<PushNamed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNamedAndRemoveUntilCopyWith<$Res> {
  factory $PushNamedAndRemoveUntilCopyWith(PushNamedAndRemoveUntil value,
          $Res Function(PushNamedAndRemoveUntil) then) =
      _$PushNamedAndRemoveUntilCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String route,
      bool Function(Route<dynamic>) predicate,
      bool useRoot});
}

/// @nodoc
class _$PushNamedAndRemoveUntilCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $PushNamedAndRemoveUntilCopyWith<$Res> {
  _$PushNamedAndRemoveUntilCopyWithImpl(PushNamedAndRemoveUntil _value,
      $Res Function(PushNamedAndRemoveUntil) _then)
      : super(_value, (v) => _then(v as PushNamedAndRemoveUntil));

  @override
  PushNamedAndRemoveUntil get _value => super._value as PushNamedAndRemoveUntil;

  @override
  $Res call({
    Object? context = freezed,
    Object? route = freezed,
    Object? predicate = freezed,
    Object? useRoot = freezed,
  }) {
    return _then(PushNamedAndRemoveUntil(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      predicate == freezed
          ? _value.predicate
          : predicate // ignore: cast_nullable_to_non_nullable
              as bool Function(Route<dynamic>),
      useRoot == freezed
          ? _value.useRoot
          : useRoot // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PushNamedAndRemoveUntil implements PushNamedAndRemoveUntil {
  const _$PushNamedAndRemoveUntil(
      this.context, this.route, this.predicate, this.useRoot);

  @override
  final BuildContext context;
  @override
  final String route;
  @override
  final bool Function(Route<dynamic>) predicate;
  @override
  final bool useRoot;

  @override
  String toString() {
    return 'NavigationEvent.pushNamedAndRemoveUntil(context: $context, route: $route, predicate: $predicate, useRoot: $useRoot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PushNamedAndRemoveUntil &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.predicate, predicate) ||
                other.predicate == predicate) &&
            (identical(other.useRoot, useRoot) || other.useRoot == useRoot));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, route, predicate, useRoot);

  @JsonKey(ignore: true)
  @override
  $PushNamedAndRemoveUntilCopyWith<PushNamedAndRemoveUntil> get copyWith =>
      _$PushNamedAndRemoveUntilCopyWithImpl<PushNamedAndRemoveUntil>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(
            BuildContext context, Route<dynamic> route, bool useRoot)
        push,
    required TResult Function(BuildContext context, String route, bool useRoot)
        pushNamed,
    required TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)
        pushNamedAndRemoveUntil,
    required TResult Function(BuildContext context, bool useRoot) pop,
  }) {
    return pushNamedAndRemoveUntil(context, route, predicate, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
  }) {
    return pushNamedAndRemoveUntil?.call(context, route, predicate, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
    required TResult orElse(),
  }) {
    if (pushNamedAndRemoveUntil != null) {
      return pushNamedAndRemoveUntil(context, route, predicate, useRoot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(Push value) push,
    required TResult Function(PushNamed value) pushNamed,
    required TResult Function(PushNamedAndRemoveUntil value)
        pushNamedAndRemoveUntil,
    required TResult Function(Pop value) pop,
  }) {
    return pushNamedAndRemoveUntil(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
  }) {
    return pushNamedAndRemoveUntil?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) {
    if (pushNamedAndRemoveUntil != null) {
      return pushNamedAndRemoveUntil(this);
    }
    return orElse();
  }
}

abstract class PushNamedAndRemoveUntil implements NavigationEvent {
  const factory PushNamedAndRemoveUntil(
      BuildContext context,
      String route,
      bool Function(Route<dynamic>) predicate,
      bool useRoot) = _$PushNamedAndRemoveUntil;

  BuildContext get context;
  String get route;
  bool Function(Route<dynamic>) get predicate;
  bool get useRoot;
  @JsonKey(ignore: true)
  $PushNamedAndRemoveUntilCopyWith<PushNamedAndRemoveUntil> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopCopyWith<$Res> {
  factory $PopCopyWith(Pop value, $Res Function(Pop) then) =
      _$PopCopyWithImpl<$Res>;
  $Res call({BuildContext context, bool useRoot});
}

/// @nodoc
class _$PopCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $PopCopyWith<$Res> {
  _$PopCopyWithImpl(Pop _value, $Res Function(Pop) _then)
      : super(_value, (v) => _then(v as Pop));

  @override
  Pop get _value => super._value as Pop;

  @override
  $Res call({
    Object? context = freezed,
    Object? useRoot = freezed,
  }) {
    return _then(Pop(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      useRoot == freezed
          ? _value.useRoot
          : useRoot // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$Pop implements Pop {
  const _$Pop(this.context, this.useRoot);

  @override
  final BuildContext context;
  @override
  final bool useRoot;

  @override
  String toString() {
    return 'NavigationEvent.pop(context: $context, useRoot: $useRoot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Pop &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.useRoot, useRoot) || other.useRoot == useRoot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, useRoot);

  @JsonKey(ignore: true)
  @override
  $PopCopyWith<Pop> get copyWith => _$PopCopyWithImpl<Pop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(
            BuildContext context, Route<dynamic> route, bool useRoot)
        push,
    required TResult Function(BuildContext context, String route, bool useRoot)
        pushNamed,
    required TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)
        pushNamedAndRemoveUntil,
    required TResult Function(BuildContext context, bool useRoot) pop,
  }) {
    return pop(context, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
  }) {
    return pop?.call(context, useRoot);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(BuildContext context, Route<dynamic> route, bool useRoot)?
        push,
    TResult Function(BuildContext context, String route, bool useRoot)?
        pushNamed,
    TResult Function(BuildContext context, String route,
            bool Function(Route<dynamic>) predicate, bool useRoot)?
        pushNamedAndRemoveUntil,
    TResult Function(BuildContext context, bool useRoot)? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(context, useRoot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(Push value) push,
    required TResult Function(PushNamed value) pushNamed,
    required TResult Function(PushNamedAndRemoveUntil value)
        pushNamedAndRemoveUntil,
    required TResult Function(Pop value) pop,
  }) {
    return pop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
  }) {
    return pop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(Push value)? push,
    TResult Function(PushNamed value)? pushNamed,
    TResult Function(PushNamedAndRemoveUntil value)? pushNamedAndRemoveUntil,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }
}

abstract class Pop implements NavigationEvent {
  const factory Pop(BuildContext context, bool useRoot) = _$Pop;

  BuildContext get context;
  bool get useRoot;
  @JsonKey(ignore: true)
  $PopCopyWith<Pop> get copyWith => throw _privateConstructorUsedError;
}
