// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  AuthEventInitial initialEvent() {
    return const AuthEventInitial();
  }

  AuthEventSignIn signInEvent({required String id, required String password}) {
    return AuthEventSignIn(
      id: id,
      password: password,
    );
  }

  AuthEventSignUp signUpEvent(
      {required RegisterOptions option, required String id}) {
    return AuthEventSignUp(
      option: option,
      id: id,
    );
  }

  AuthEventSignOut signOutEvent() {
    return const AuthEventSignOut();
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
    required TResult Function(AuthEventInitial value) initialEvent,
    required TResult Function(AuthEventSignIn value) signInEvent,
    required TResult Function(AuthEventSignUp value) signUpEvent,
    required TResult Function(AuthEventSignOut value) signOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
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
abstract class $AuthEventInitialCopyWith<$Res> {
  factory $AuthEventInitialCopyWith(
          AuthEventInitial value, $Res Function(AuthEventInitial) then) =
      _$AuthEventInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventInitialCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventInitialCopyWith<$Res> {
  _$AuthEventInitialCopyWithImpl(
      AuthEventInitial _value, $Res Function(AuthEventInitial) _then)
      : super(_value, (v) => _then(v as AuthEventInitial));

  @override
  AuthEventInitial get _value => super._value as AuthEventInitial;
}

/// @nodoc

class _$AuthEventInitial implements AuthEventInitial {
  const _$AuthEventInitial();

  @override
  String toString() {
    return 'AuthEvent.initialEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEventInitial);
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
    required TResult Function(AuthEventInitial value) initialEvent,
    required TResult Function(AuthEventSignIn value) signInEvent,
    required TResult Function(AuthEventSignUp value) signUpEvent,
    required TResult Function(AuthEventSignOut value) signOutEvent,
  }) {
    return initialEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
  }) {
    return initialEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (initialEvent != null) {
      return initialEvent(this);
    }
    return orElse();
  }
}

abstract class AuthEventInitial implements AuthEvent {
  const factory AuthEventInitial() = _$AuthEventInitial;
}

/// @nodoc
abstract class $AuthEventSignInCopyWith<$Res> {
  factory $AuthEventSignInCopyWith(
          AuthEventSignIn value, $Res Function(AuthEventSignIn) then) =
      _$AuthEventSignInCopyWithImpl<$Res>;
  $Res call({String id, String password});
}

/// @nodoc
class _$AuthEventSignInCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventSignInCopyWith<$Res> {
  _$AuthEventSignInCopyWithImpl(
      AuthEventSignIn _value, $Res Function(AuthEventSignIn) _then)
      : super(_value, (v) => _then(v as AuthEventSignIn));

  @override
  AuthEventSignIn get _value => super._value as AuthEventSignIn;

  @override
  $Res call({
    Object? id = freezed,
    Object? password = freezed,
  }) {
    return _then(AuthEventSignIn(
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

class _$AuthEventSignIn implements AuthEventSignIn {
  const _$AuthEventSignIn({required this.id, required this.password});

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
            other is AuthEventSignIn &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  $AuthEventSignInCopyWith<AuthEventSignIn> get copyWith =>
      _$AuthEventSignInCopyWithImpl<AuthEventSignIn>(this, _$identity);

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
    required TResult Function(AuthEventInitial value) initialEvent,
    required TResult Function(AuthEventSignIn value) signInEvent,
    required TResult Function(AuthEventSignUp value) signUpEvent,
    required TResult Function(AuthEventSignOut value) signOutEvent,
  }) {
    return signInEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
  }) {
    return signInEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(this);
    }
    return orElse();
  }
}

abstract class AuthEventSignIn implements AuthEvent {
  const factory AuthEventSignIn(
      {required String id, required String password}) = _$AuthEventSignIn;

  String get id;
  String get password;
  @JsonKey(ignore: true)
  $AuthEventSignInCopyWith<AuthEventSignIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventSignUpCopyWith<$Res> {
  factory $AuthEventSignUpCopyWith(
          AuthEventSignUp value, $Res Function(AuthEventSignUp) then) =
      _$AuthEventSignUpCopyWithImpl<$Res>;
  $Res call({RegisterOptions option, String id});
}

/// @nodoc
class _$AuthEventSignUpCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventSignUpCopyWith<$Res> {
  _$AuthEventSignUpCopyWithImpl(
      AuthEventSignUp _value, $Res Function(AuthEventSignUp) _then)
      : super(_value, (v) => _then(v as AuthEventSignUp));

  @override
  AuthEventSignUp get _value => super._value as AuthEventSignUp;

  @override
  $Res call({
    Object? option = freezed,
    Object? id = freezed,
  }) {
    return _then(AuthEventSignUp(
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

class _$AuthEventSignUp implements AuthEventSignUp {
  const _$AuthEventSignUp({required this.option, required this.id});

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
            other is AuthEventSignUp &&
            const DeepCollectionEquality().equals(other.option, option) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(option),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  $AuthEventSignUpCopyWith<AuthEventSignUp> get copyWith =>
      _$AuthEventSignUpCopyWithImpl<AuthEventSignUp>(this, _$identity);

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
    required TResult Function(AuthEventInitial value) initialEvent,
    required TResult Function(AuthEventSignIn value) signInEvent,
    required TResult Function(AuthEventSignUp value) signUpEvent,
    required TResult Function(AuthEventSignOut value) signOutEvent,
  }) {
    return signUpEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
  }) {
    return signUpEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (signUpEvent != null) {
      return signUpEvent(this);
    }
    return orElse();
  }
}

abstract class AuthEventSignUp implements AuthEvent {
  const factory AuthEventSignUp(
      {required RegisterOptions option,
      required String id}) = _$AuthEventSignUp;

  RegisterOptions get option;
  String get id;
  @JsonKey(ignore: true)
  $AuthEventSignUpCopyWith<AuthEventSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventSignOutCopyWith<$Res> {
  factory $AuthEventSignOutCopyWith(
          AuthEventSignOut value, $Res Function(AuthEventSignOut) then) =
      _$AuthEventSignOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventSignOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventSignOutCopyWith<$Res> {
  _$AuthEventSignOutCopyWithImpl(
      AuthEventSignOut _value, $Res Function(AuthEventSignOut) _then)
      : super(_value, (v) => _then(v as AuthEventSignOut));

  @override
  AuthEventSignOut get _value => super._value as AuthEventSignOut;
}

/// @nodoc

class _$AuthEventSignOut implements AuthEventSignOut {
  const _$AuthEventSignOut();

  @override
  String toString() {
    return 'AuthEvent.signOutEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEventSignOut);
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
    required TResult Function(AuthEventInitial value) initialEvent,
    required TResult Function(AuthEventSignIn value) signInEvent,
    required TResult Function(AuthEventSignUp value) signUpEvent,
    required TResult Function(AuthEventSignOut value) signOutEvent,
  }) {
    return signOutEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
  }) {
    return signOutEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initialEvent,
    TResult Function(AuthEventSignIn value)? signInEvent,
    TResult Function(AuthEventSignUp value)? signUpEvent,
    TResult Function(AuthEventSignOut value)? signOutEvent,
    required TResult orElse(),
  }) {
    if (signOutEvent != null) {
      return signOutEvent(this);
    }
    return orElse();
  }
}

abstract class AuthEventSignOut implements AuthEvent {
  const factory AuthEventSignOut() = _$AuthEventSignOut;
}
