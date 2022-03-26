// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageStateTearOff {
  const _$MessageStateTearOff();

  MessageStateInitial initial() {
    return const MessageStateInitial();
  }

  MessageStateLoading loading() {
    return const MessageStateLoading();
  }

  MessageStateMessageFetched loaded(List<Message> messages) {
    return MessageStateMessageFetched(
      messages,
    );
  }
}

/// @nodoc
const $MessageState = _$MessageStateTearOff();

/// @nodoc
mixin _$MessageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Message> messages) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStateInitial value) initial,
    required TResult Function(MessageStateLoading value) loading,
    required TResult Function(MessageStateMessageFetched value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res> implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  final MessageState _value;
  // ignore: unused_field
  final $Res Function(MessageState) _then;
}

/// @nodoc
abstract class $MessageStateInitialCopyWith<$Res> {
  factory $MessageStateInitialCopyWith(
          MessageStateInitial value, $Res Function(MessageStateInitial) then) =
      _$MessageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageStateInitialCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res>
    implements $MessageStateInitialCopyWith<$Res> {
  _$MessageStateInitialCopyWithImpl(
      MessageStateInitial _value, $Res Function(MessageStateInitial) _then)
      : super(_value, (v) => _then(v as MessageStateInitial));

  @override
  MessageStateInitial get _value => super._value as MessageStateInitial;
}

/// @nodoc

class _$MessageStateInitial implements MessageStateInitial {
  const _$MessageStateInitial();

  @override
  String toString() {
    return 'MessageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MessageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Message> messages) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
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
    required TResult Function(MessageStateInitial value) initial,
    required TResult Function(MessageStateLoading value) loading,
    required TResult Function(MessageStateMessageFetched value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MessageStateInitial implements MessageState {
  const factory MessageStateInitial() = _$MessageStateInitial;
}

/// @nodoc
abstract class $MessageStateLoadingCopyWith<$Res> {
  factory $MessageStateLoadingCopyWith(
          MessageStateLoading value, $Res Function(MessageStateLoading) then) =
      _$MessageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageStateLoadingCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res>
    implements $MessageStateLoadingCopyWith<$Res> {
  _$MessageStateLoadingCopyWithImpl(
      MessageStateLoading _value, $Res Function(MessageStateLoading) _then)
      : super(_value, (v) => _then(v as MessageStateLoading));

  @override
  MessageStateLoading get _value => super._value as MessageStateLoading;
}

/// @nodoc

class _$MessageStateLoading implements MessageStateLoading {
  const _$MessageStateLoading();

  @override
  String toString() {
    return 'MessageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MessageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Message> messages) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
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
    required TResult Function(MessageStateInitial value) initial,
    required TResult Function(MessageStateLoading value) loading,
    required TResult Function(MessageStateMessageFetched value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MessageStateLoading implements MessageState {
  const factory MessageStateLoading() = _$MessageStateLoading;
}

/// @nodoc
abstract class $MessageStateMessageFetchedCopyWith<$Res> {
  factory $MessageStateMessageFetchedCopyWith(MessageStateMessageFetched value,
          $Res Function(MessageStateMessageFetched) then) =
      _$MessageStateMessageFetchedCopyWithImpl<$Res>;
  $Res call({List<Message> messages});
}

/// @nodoc
class _$MessageStateMessageFetchedCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res>
    implements $MessageStateMessageFetchedCopyWith<$Res> {
  _$MessageStateMessageFetchedCopyWithImpl(MessageStateMessageFetched _value,
      $Res Function(MessageStateMessageFetched) _then)
      : super(_value, (v) => _then(v as MessageStateMessageFetched));

  @override
  MessageStateMessageFetched get _value =>
      super._value as MessageStateMessageFetched;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(MessageStateMessageFetched(
      messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$MessageStateMessageFetched implements MessageStateMessageFetched {
  const _$MessageStateMessageFetched(this.messages);

  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'MessageState.loaded(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageStateMessageFetched &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  $MessageStateMessageFetchedCopyWith<MessageStateMessageFetched>
      get copyWith =>
          _$MessageStateMessageFetchedCopyWithImpl<MessageStateMessageFetched>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Message> messages) loaded,
  }) {
    return loaded(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
  }) {
    return loaded?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Message> messages)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStateInitial value) initial,
    required TResult Function(MessageStateLoading value) loading,
    required TResult Function(MessageStateMessageFetched value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateLoading value)? loading,
    TResult Function(MessageStateMessageFetched value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MessageStateMessageFetched implements MessageState {
  const factory MessageStateMessageFetched(List<Message> messages) =
      _$MessageStateMessageFetched;

  List<Message> get messages;
  @JsonKey(ignore: true)
  $MessageStateMessageFetchedCopyWith<MessageStateMessageFetched>
      get copyWith => throw _privateConstructorUsedError;
}
