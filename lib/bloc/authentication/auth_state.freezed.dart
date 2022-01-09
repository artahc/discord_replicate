// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  AuthStateInitial initial() {
    return const AuthStateInitial();
  }

  AuthStateSigningIn signingIn() {
    return const AuthStateSigningIn();
  }

  AuthStateSignedIn signedIn({required Credential credential}) {
    return AuthStateSignedIn(
      credential: credential,
    );
  }

  AuthStateSignedOut signedOut() {
    return const AuthStateSignedOut();
  }

  AuthStateError error({required Exception exception}) {
    return AuthStateError(
      exception: exception,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function(Credential credential) signedIn,
    required TResult Function() signedOut,
    required TResult Function(Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthStateInitialCopyWith<$Res> {
  factory $AuthStateInitialCopyWith(
          AuthStateInitial value, $Res Function(AuthStateInitial) then) =
      _$AuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateInitialCopyWith<$Res> {
  _$AuthStateInitialCopyWithImpl(
      AuthStateInitial _value, $Res Function(AuthStateInitial) _then)
      : super(_value, (v) => _then(v as AuthStateInitial));

  @override
  AuthStateInitial get _value => super._value as AuthStateInitial;
}

/// @nodoc

class _$AuthStateInitial implements AuthStateInitial {
  const _$AuthStateInitial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function(Credential credential) signedIn,
    required TResult Function() signedOut,
    required TResult Function(Exception exception) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
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
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStateInitial implements AuthState {
  const factory AuthStateInitial() = _$AuthStateInitial;
}

/// @nodoc
abstract class $AuthStateSigningInCopyWith<$Res> {
  factory $AuthStateSigningInCopyWith(
          AuthStateSigningIn value, $Res Function(AuthStateSigningIn) then) =
      _$AuthStateSigningInCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateSigningInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateSigningInCopyWith<$Res> {
  _$AuthStateSigningInCopyWithImpl(
      AuthStateSigningIn _value, $Res Function(AuthStateSigningIn) _then)
      : super(_value, (v) => _then(v as AuthStateSigningIn));

  @override
  AuthStateSigningIn get _value => super._value as AuthStateSigningIn;
}

/// @nodoc

class _$AuthStateSigningIn implements AuthStateSigningIn {
  const _$AuthStateSigningIn();

  @override
  String toString() {
    return 'AuthState.signingIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateSigningIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function(Credential credential) signedIn,
    required TResult Function() signedOut,
    required TResult Function(Exception exception) error,
  }) {
    return signingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
  }) {
    return signingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateError value) error,
  }) {
    return signingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
  }) {
    return signingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn(this);
    }
    return orElse();
  }
}

abstract class AuthStateSigningIn implements AuthState {
  const factory AuthStateSigningIn() = _$AuthStateSigningIn;
}

/// @nodoc
abstract class $AuthStateSignedInCopyWith<$Res> {
  factory $AuthStateSignedInCopyWith(
          AuthStateSignedIn value, $Res Function(AuthStateSignedIn) then) =
      _$AuthStateSignedInCopyWithImpl<$Res>;
  $Res call({Credential credential});
}

/// @nodoc
class _$AuthStateSignedInCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateSignedInCopyWith<$Res> {
  _$AuthStateSignedInCopyWithImpl(
      AuthStateSignedIn _value, $Res Function(AuthStateSignedIn) _then)
      : super(_value, (v) => _then(v as AuthStateSignedIn));

  @override
  AuthStateSignedIn get _value => super._value as AuthStateSignedIn;

  @override
  $Res call({
    Object? credential = freezed,
  }) {
    return _then(AuthStateSignedIn(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
    ));
  }
}

/// @nodoc

class _$AuthStateSignedIn implements AuthStateSignedIn {
  const _$AuthStateSignedIn({required this.credential});

  @override
  final Credential credential;

  @override
  String toString() {
    return 'AuthState.signedIn(credential: $credential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthStateSignedIn &&
            const DeepCollectionEquality()
                .equals(other.credential, credential));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(credential));

  @JsonKey(ignore: true)
  @override
  $AuthStateSignedInCopyWith<AuthStateSignedIn> get copyWith =>
      _$AuthStateSignedInCopyWithImpl<AuthStateSignedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function(Credential credential) signedIn,
    required TResult Function() signedOut,
    required TResult Function(Exception exception) error,
  }) {
    return signedIn(credential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
  }) {
    return signedIn?.call(credential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(credential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateError value) error,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class AuthStateSignedIn implements AuthState {
  const factory AuthStateSignedIn({required Credential credential}) =
      _$AuthStateSignedIn;

  Credential get credential;
  @JsonKey(ignore: true)
  $AuthStateSignedInCopyWith<AuthStateSignedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateSignedOutCopyWith<$Res> {
  factory $AuthStateSignedOutCopyWith(
          AuthStateSignedOut value, $Res Function(AuthStateSignedOut) then) =
      _$AuthStateSignedOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateSignedOutCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateSignedOutCopyWith<$Res> {
  _$AuthStateSignedOutCopyWithImpl(
      AuthStateSignedOut _value, $Res Function(AuthStateSignedOut) _then)
      : super(_value, (v) => _then(v as AuthStateSignedOut));

  @override
  AuthStateSignedOut get _value => super._value as AuthStateSignedOut;
}

/// @nodoc

class _$AuthStateSignedOut implements AuthStateSignedOut {
  const _$AuthStateSignedOut();

  @override
  String toString() {
    return 'AuthState.signedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStateSignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function(Credential credential) signedIn,
    required TResult Function() signedOut,
    required TResult Function(Exception exception) error,
  }) {
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
  }) {
    return signedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateError value) error,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class AuthStateSignedOut implements AuthState {
  const factory AuthStateSignedOut() = _$AuthStateSignedOut;
}

/// @nodoc
abstract class $AuthStateErrorCopyWith<$Res> {
  factory $AuthStateErrorCopyWith(
          AuthStateError value, $Res Function(AuthStateError) then) =
      _$AuthStateErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class _$AuthStateErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateErrorCopyWith<$Res> {
  _$AuthStateErrorCopyWithImpl(
      AuthStateError _value, $Res Function(AuthStateError) _then)
      : super(_value, (v) => _then(v as AuthStateError));

  @override
  AuthStateError get _value => super._value as AuthStateError;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(AuthStateError(
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$AuthStateError implements AuthStateError {
  const _$AuthStateError({required this.exception});

  @override
  final Exception exception;

  @override
  String toString() {
    return 'AuthState.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthStateError &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  $AuthStateErrorCopyWith<AuthStateError> get copyWith =>
      _$AuthStateErrorCopyWithImpl<AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function(Credential credential) signedIn,
    required TResult Function() signedOut,
    required TResult Function(Exception exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function(Credential credential)? signedIn,
    TResult Function()? signedOut,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateSigningIn value) signingIn,
    required TResult Function(AuthStateSignedIn value) signedIn,
    required TResult Function(AuthStateSignedOut value) signedOut,
    required TResult Function(AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateSigningIn value)? signingIn,
    TResult Function(AuthStateSignedIn value)? signedIn,
    TResult Function(AuthStateSignedOut value)? signedOut,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateError implements AuthState {
  const factory AuthStateError({required Exception exception}) =
      _$AuthStateError;

  Exception get exception;
  @JsonKey(ignore: true)
  $AuthStateErrorCopyWith<AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
