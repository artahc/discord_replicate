// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  InitialEvent initialEvent() {
    return const InitialEvent();
  }

  AuthSignInEvent signInEvent({required String id, required String password}) {
    return AuthSignInEvent(
      id: id,
      password: password,
    );
  }

  AuthSignUpEvent signUpEvent(
      {required RegisterOptions option, required String id}) {
    return AuthSignUpEvent(
      option: option,
      id: id,
    );
  }

  AuthSignOutEvent signOutEvent() {
    return const AuthSignOutEvent();
  }
}

/// @nodoc
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(String id, String password) signInEvent,
    required TResult Function(RegisterOptions option, String id) signUpEvent,
    required TResult Function() signOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(AuthSignInEvent value) signInEvent,
    required TResult Function(AuthSignUpEvent value) signUpEvent,
    required TResult Function(AuthSignOutEvent value) signOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $InitialEventCopyWith<$Res> {
  factory $InitialEventCopyWith(
          InitialEvent value, $Res Function(InitialEvent) then) =
      _$InitialEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialEventCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
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
    return 'AuthEvent.initialEvent()';
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
    required TResult Function(String id, String password) signInEvent,
    required TResult Function(RegisterOptions option, String id) signUpEvent,
    required TResult Function() signOutEvent,
  }) {
    return initialEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
  }) {
    return initialEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
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
    required TResult Function(AuthSignInEvent value) signInEvent,
    required TResult Function(AuthSignUpEvent value) signUpEvent,
    required TResult Function(AuthSignOutEvent value) signOutEvent,
  }) {
    return initialEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
  }) {
    return initialEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (initialEvent != null) {
      return initialEvent(this);
    }
    return orElse();
  }
}

abstract class InitialEvent implements AuthEvent {
  const factory InitialEvent() = _$InitialEvent;
}

/// @nodoc
abstract class $AuthSignInEventCopyWith<$Res> {
  factory $AuthSignInEventCopyWith(
          AuthSignInEvent value, $Res Function(AuthSignInEvent) then) =
      _$AuthSignInEventCopyWithImpl<$Res>;
  $Res call({String id, String password});
}

/// @nodoc
class _$AuthSignInEventCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthSignInEventCopyWith<$Res> {
  _$AuthSignInEventCopyWithImpl(
      AuthSignInEvent _value, $Res Function(AuthSignInEvent) _then)
      : super(_value, (v) => _then(v as AuthSignInEvent));

  @override
  AuthSignInEvent get _value => super._value as AuthSignInEvent;

  @override
  $Res call({
    Object? id = freezed,
    Object? password = freezed,
  }) {
    return _then(AuthSignInEvent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignInEvent implements AuthSignInEvent {
  const _$AuthSignInEvent({required this.id, required this.password});

  @override
  final String id;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInEvent(id: $id, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSignInEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, password);

  @JsonKey(ignore: true)
  @override
  $AuthSignInEventCopyWith<AuthSignInEvent> get copyWith =>
      _$AuthSignInEventCopyWithImpl<AuthSignInEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(String id, String password) signInEvent,
    required TResult Function(RegisterOptions option, String id) signUpEvent,
    required TResult Function() signOutEvent,
  }) {
    return signInEvent(id, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
  }) {
    return signInEvent?.call(id, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(id, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(AuthSignInEvent value) signInEvent,
    required TResult Function(AuthSignUpEvent value) signUpEvent,
    required TResult Function(AuthSignOutEvent value) signOutEvent,
  }) {
    return signInEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
  }) {
    return signInEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(this);
    }
    return orElse();
  }
}

abstract class AuthSignInEvent implements AuthEvent {
  const factory AuthSignInEvent(
      {required String id, required String password}) = _$AuthSignInEvent;

  String get id;
  String get password;
  @JsonKey(ignore: true)
  $AuthSignInEventCopyWith<AuthSignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSignUpEventCopyWith<$Res> {
  factory $AuthSignUpEventCopyWith(
          AuthSignUpEvent value, $Res Function(AuthSignUpEvent) then) =
      _$AuthSignUpEventCopyWithImpl<$Res>;
  $Res call({RegisterOptions option, String id});
}

/// @nodoc
class _$AuthSignUpEventCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthSignUpEventCopyWith<$Res> {
  _$AuthSignUpEventCopyWithImpl(
      AuthSignUpEvent _value, $Res Function(AuthSignUpEvent) _then)
      : super(_value, (v) => _then(v as AuthSignUpEvent));

  @override
  AuthSignUpEvent get _value => super._value as AuthSignUpEvent;

  @override
  $Res call({
    Object? option = freezed,
    Object? id = freezed,
  }) {
    return _then(AuthSignUpEvent(
      option: option == freezed
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as RegisterOptions,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignUpEvent implements AuthSignUpEvent {
  const _$AuthSignUpEvent({required this.option, required this.id});

  @override
  final RegisterOptions option;
  @override
  final String id;

  @override
  String toString() {
    return 'AuthEvent.signUpEvent(option: $option, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthSignUpEvent &&
            (identical(other.option, option) || other.option == option) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, option, id);

  @JsonKey(ignore: true)
  @override
  $AuthSignUpEventCopyWith<AuthSignUpEvent> get copyWith =>
      _$AuthSignUpEventCopyWithImpl<AuthSignUpEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(String id, String password) signInEvent,
    required TResult Function(RegisterOptions option, String id) signUpEvent,
    required TResult Function() signOutEvent,
  }) {
    return signUpEvent(option, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
  }) {
    return signUpEvent?.call(option, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
    required TResult orElse(),
  }) {
    if (signUpEvent != null) {
      return signUpEvent(option, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(AuthSignInEvent value) signInEvent,
    required TResult Function(AuthSignUpEvent value) signUpEvent,
    required TResult Function(AuthSignOutEvent value) signOutEvent,
  }) {
    return signUpEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
  }) {
    return signUpEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (signUpEvent != null) {
      return signUpEvent(this);
    }
    return orElse();
  }
}

abstract class AuthSignUpEvent implements AuthEvent {
  const factory AuthSignUpEvent(
      {required RegisterOptions option,
      required String id}) = _$AuthSignUpEvent;

  RegisterOptions get option;
  String get id;
  @JsonKey(ignore: true)
  $AuthSignUpEventCopyWith<AuthSignUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSignOutEventCopyWith<$Res> {
  factory $AuthSignOutEventCopyWith(
          AuthSignOutEvent value, $Res Function(AuthSignOutEvent) then) =
      _$AuthSignOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthSignOutEventCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthSignOutEventCopyWith<$Res> {
  _$AuthSignOutEventCopyWithImpl(
      AuthSignOutEvent _value, $Res Function(AuthSignOutEvent) _then)
      : super(_value, (v) => _then(v as AuthSignOutEvent));

  @override
  AuthSignOutEvent get _value => super._value as AuthSignOutEvent;
}

/// @nodoc

class _$AuthSignOutEvent implements AuthSignOutEvent {
  const _$AuthSignOutEvent();

  @override
  String toString() {
    return 'AuthEvent.signOutEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthSignOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialEvent,
    required TResult Function(String id, String password) signInEvent,
    required TResult Function(RegisterOptions option, String id) signUpEvent,
    required TResult Function() signOutEvent,
  }) {
    return signOutEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
  }) {
    return signOutEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialEvent,
    TResult Function(String id, String password)? signInEvent,
    TResult Function(RegisterOptions option, String id)? signUpEvent,
    TResult Function()? signOutEvent,
    required TResult orElse(),
  }) {
    if (signOutEvent != null) {
      return signOutEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialEvent value) initialEvent,
    required TResult Function(AuthSignInEvent value) signInEvent,
    required TResult Function(AuthSignUpEvent value) signUpEvent,
    required TResult Function(AuthSignOutEvent value) signOutEvent,
  }) {
    return signOutEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
  }) {
    return signOutEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialEvent value)? initialEvent,
    TResult Function(AuthSignInEvent value)? signInEvent,
    TResult Function(AuthSignUpEvent value)? signUpEvent,
    TResult Function(AuthSignOutEvent value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (signOutEvent != null) {
      return signOutEvent(this);
    }
    return orElse();
  }
}

abstract class AuthSignOutEvent implements AuthEvent {
  const factory AuthSignOutEvent() = _$AuthSignOutEvent;
}
