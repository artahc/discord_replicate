// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_state.dart';

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

  MessageStateNewMessage onReceiveNewMessage(Message message) {
    return MessageStateNewMessage(
      message,
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
    required TResult Function(Message message) onReceiveNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Message message)? onReceiveNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Message message)? onReceiveNewMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStateInitial value) initial,
    required TResult Function(MessageStateNewMessage value) onReceiveNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateNewMessage value)? onReceiveNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateNewMessage value)? onReceiveNewMessage,
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
    required TResult Function(Message message) onReceiveNewMessage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Message message)? onReceiveNewMessage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Message message)? onReceiveNewMessage,
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
    required TResult Function(MessageStateNewMessage value) onReceiveNewMessage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateNewMessage value)? onReceiveNewMessage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateNewMessage value)? onReceiveNewMessage,
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
abstract class $MessageStateNewMessageCopyWith<$Res> {
  factory $MessageStateNewMessageCopyWith(MessageStateNewMessage value,
          $Res Function(MessageStateNewMessage) then) =
      _$MessageStateNewMessageCopyWithImpl<$Res>;
  $Res call({Message message});
}

/// @nodoc
class _$MessageStateNewMessageCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res>
    implements $MessageStateNewMessageCopyWith<$Res> {
  _$MessageStateNewMessageCopyWithImpl(MessageStateNewMessage _value,
      $Res Function(MessageStateNewMessage) _then)
      : super(_value, (v) => _then(v as MessageStateNewMessage));

  @override
  MessageStateNewMessage get _value => super._value as MessageStateNewMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(MessageStateNewMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }
}

/// @nodoc

class _$MessageStateNewMessage implements MessageStateNewMessage {
  const _$MessageStateNewMessage(this.message);

  @override
  final Message message;

  @override
  String toString() {
    return 'MessageState.onReceiveNewMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageStateNewMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $MessageStateNewMessageCopyWith<MessageStateNewMessage> get copyWith =>
      _$MessageStateNewMessageCopyWithImpl<MessageStateNewMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Message message) onReceiveNewMessage,
  }) {
    return onReceiveNewMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Message message)? onReceiveNewMessage,
  }) {
    return onReceiveNewMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Message message)? onReceiveNewMessage,
    required TResult orElse(),
  }) {
    if (onReceiveNewMessage != null) {
      return onReceiveNewMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageStateInitial value) initial,
    required TResult Function(MessageStateNewMessage value) onReceiveNewMessage,
  }) {
    return onReceiveNewMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateNewMessage value)? onReceiveNewMessage,
  }) {
    return onReceiveNewMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageStateInitial value)? initial,
    TResult Function(MessageStateNewMessage value)? onReceiveNewMessage,
    required TResult orElse(),
  }) {
    if (onReceiveNewMessage != null) {
      return onReceiveNewMessage(this);
    }
    return orElse();
  }
}

abstract class MessageStateNewMessage implements MessageState {
  const factory MessageStateNewMessage(Message message) =
      _$MessageStateNewMessage;

  Message get message;
  @JsonKey(ignore: true)
  $MessageStateNewMessageCopyWith<MessageStateNewMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
