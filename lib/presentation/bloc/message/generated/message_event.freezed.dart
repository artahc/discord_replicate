// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../message_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageEventTearOff {
  const _$MessageEventTearOff();

  MessageEventFetchInitialMessages fetchInitialMessage() {
    return const MessageEventFetchInitialMessages();
  }

  MessageEventFetchPreviousMessage fetchPreviousMessage(
      String lastMessageId, int limit) {
    return MessageEventFetchPreviousMessage(
      lastMessageId,
      limit,
    );
  }

  MessageEventFetchLatestMessage fetchLatestMessage() {
    return const MessageEventFetchLatestMessage();
  }

  MessageEventSendMessage sendMessage(String message) {
    return MessageEventSendMessage(
      message,
    );
  }

  MessageEventNotifyNewMessage notifyNewMessage(Message message) {
    return MessageEventNotifyNewMessage(
      message,
    );
  }
}

/// @nodoc
const $MessageEvent = _$MessageEventTearOff();

/// @nodoc
mixin _$MessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialMessage,
    required TResult Function(String lastMessageId, int limit)
        fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) notifyNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventFetchInitialMessages value)
        fetchInitialMessage,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
    required TResult Function(MessageEventNotifyNewMessage value)
        notifyNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventCopyWith<$Res> {
  factory $MessageEventCopyWith(
          MessageEvent value, $Res Function(MessageEvent) then) =
      _$MessageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageEventCopyWithImpl<$Res> implements $MessageEventCopyWith<$Res> {
  _$MessageEventCopyWithImpl(this._value, this._then);

  final MessageEvent _value;
  // ignore: unused_field
  final $Res Function(MessageEvent) _then;
}

/// @nodoc
abstract class $MessageEventFetchInitialMessagesCopyWith<$Res> {
  factory $MessageEventFetchInitialMessagesCopyWith(
          MessageEventFetchInitialMessages value,
          $Res Function(MessageEventFetchInitialMessages) then) =
      _$MessageEventFetchInitialMessagesCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageEventFetchInitialMessagesCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements $MessageEventFetchInitialMessagesCopyWith<$Res> {
  _$MessageEventFetchInitialMessagesCopyWithImpl(
      MessageEventFetchInitialMessages _value,
      $Res Function(MessageEventFetchInitialMessages) _then)
      : super(_value, (v) => _then(v as MessageEventFetchInitialMessages));

  @override
  MessageEventFetchInitialMessages get _value =>
      super._value as MessageEventFetchInitialMessages;
}

/// @nodoc

class _$MessageEventFetchInitialMessages
    implements MessageEventFetchInitialMessages {
  const _$MessageEventFetchInitialMessages();

  @override
  String toString() {
    return 'MessageEvent.fetchInitialMessage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventFetchInitialMessages);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialMessage,
    required TResult Function(String lastMessageId, int limit)
        fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) notifyNewMessage,
  }) {
    return fetchInitialMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
  }) {
    return fetchInitialMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (fetchInitialMessage != null) {
      return fetchInitialMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventFetchInitialMessages value)
        fetchInitialMessage,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
    required TResult Function(MessageEventNotifyNewMessage value)
        notifyNewMessage,
  }) {
    return fetchInitialMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
  }) {
    return fetchInitialMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (fetchInitialMessage != null) {
      return fetchInitialMessage(this);
    }
    return orElse();
  }
}

abstract class MessageEventFetchInitialMessages implements MessageEvent {
  const factory MessageEventFetchInitialMessages() =
      _$MessageEventFetchInitialMessages;
}

/// @nodoc
abstract class $MessageEventFetchPreviousMessageCopyWith<$Res> {
  factory $MessageEventFetchPreviousMessageCopyWith(
          MessageEventFetchPreviousMessage value,
          $Res Function(MessageEventFetchPreviousMessage) then) =
      _$MessageEventFetchPreviousMessageCopyWithImpl<$Res>;
  $Res call({String lastMessageId, int limit});
}

/// @nodoc
class _$MessageEventFetchPreviousMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements $MessageEventFetchPreviousMessageCopyWith<$Res> {
  _$MessageEventFetchPreviousMessageCopyWithImpl(
      MessageEventFetchPreviousMessage _value,
      $Res Function(MessageEventFetchPreviousMessage) _then)
      : super(_value, (v) => _then(v as MessageEventFetchPreviousMessage));

  @override
  MessageEventFetchPreviousMessage get _value =>
      super._value as MessageEventFetchPreviousMessage;

  @override
  $Res call({
    Object? lastMessageId = freezed,
    Object? limit = freezed,
  }) {
    return _then(MessageEventFetchPreviousMessage(
      lastMessageId == freezed
          ? _value.lastMessageId
          : lastMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MessageEventFetchPreviousMessage
    implements MessageEventFetchPreviousMessage {
  const _$MessageEventFetchPreviousMessage(this.lastMessageId, this.limit);

  @override
  final String lastMessageId;
  @override
  final int limit;

  @override
  String toString() {
    return 'MessageEvent.fetchPreviousMessage(lastMessageId: $lastMessageId, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventFetchPreviousMessage &&
            const DeepCollectionEquality()
                .equals(other.lastMessageId, lastMessageId) &&
            const DeepCollectionEquality().equals(other.limit, limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lastMessageId),
      const DeepCollectionEquality().hash(limit));

  @JsonKey(ignore: true)
  @override
  $MessageEventFetchPreviousMessageCopyWith<MessageEventFetchPreviousMessage>
      get copyWith => _$MessageEventFetchPreviousMessageCopyWithImpl<
          MessageEventFetchPreviousMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialMessage,
    required TResult Function(String lastMessageId, int limit)
        fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) notifyNewMessage,
  }) {
    return fetchPreviousMessage(lastMessageId, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
  }) {
    return fetchPreviousMessage?.call(lastMessageId, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (fetchPreviousMessage != null) {
      return fetchPreviousMessage(lastMessageId, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventFetchInitialMessages value)
        fetchInitialMessage,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
    required TResult Function(MessageEventNotifyNewMessage value)
        notifyNewMessage,
  }) {
    return fetchPreviousMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
  }) {
    return fetchPreviousMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (fetchPreviousMessage != null) {
      return fetchPreviousMessage(this);
    }
    return orElse();
  }
}

abstract class MessageEventFetchPreviousMessage implements MessageEvent {
  const factory MessageEventFetchPreviousMessage(
      String lastMessageId, int limit) = _$MessageEventFetchPreviousMessage;

  String get lastMessageId;
  int get limit;
  @JsonKey(ignore: true)
  $MessageEventFetchPreviousMessageCopyWith<MessageEventFetchPreviousMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventFetchLatestMessageCopyWith<$Res> {
  factory $MessageEventFetchLatestMessageCopyWith(
          MessageEventFetchLatestMessage value,
          $Res Function(MessageEventFetchLatestMessage) then) =
      _$MessageEventFetchLatestMessageCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageEventFetchLatestMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements $MessageEventFetchLatestMessageCopyWith<$Res> {
  _$MessageEventFetchLatestMessageCopyWithImpl(
      MessageEventFetchLatestMessage _value,
      $Res Function(MessageEventFetchLatestMessage) _then)
      : super(_value, (v) => _then(v as MessageEventFetchLatestMessage));

  @override
  MessageEventFetchLatestMessage get _value =>
      super._value as MessageEventFetchLatestMessage;
}

/// @nodoc

class _$MessageEventFetchLatestMessage
    implements MessageEventFetchLatestMessage {
  const _$MessageEventFetchLatestMessage();

  @override
  String toString() {
    return 'MessageEvent.fetchLatestMessage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventFetchLatestMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialMessage,
    required TResult Function(String lastMessageId, int limit)
        fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) notifyNewMessage,
  }) {
    return fetchLatestMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
  }) {
    return fetchLatestMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (fetchLatestMessage != null) {
      return fetchLatestMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventFetchInitialMessages value)
        fetchInitialMessage,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
    required TResult Function(MessageEventNotifyNewMessage value)
        notifyNewMessage,
  }) {
    return fetchLatestMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
  }) {
    return fetchLatestMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (fetchLatestMessage != null) {
      return fetchLatestMessage(this);
    }
    return orElse();
  }
}

abstract class MessageEventFetchLatestMessage implements MessageEvent {
  const factory MessageEventFetchLatestMessage() =
      _$MessageEventFetchLatestMessage;
}

/// @nodoc
abstract class $MessageEventSendMessageCopyWith<$Res> {
  factory $MessageEventSendMessageCopyWith(MessageEventSendMessage value,
          $Res Function(MessageEventSendMessage) then) =
      _$MessageEventSendMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$MessageEventSendMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements $MessageEventSendMessageCopyWith<$Res> {
  _$MessageEventSendMessageCopyWithImpl(MessageEventSendMessage _value,
      $Res Function(MessageEventSendMessage) _then)
      : super(_value, (v) => _then(v as MessageEventSendMessage));

  @override
  MessageEventSendMessage get _value => super._value as MessageEventSendMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(MessageEventSendMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageEventSendMessage implements MessageEventSendMessage {
  const _$MessageEventSendMessage(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MessageEvent.sendMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventSendMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $MessageEventSendMessageCopyWith<MessageEventSendMessage> get copyWith =>
      _$MessageEventSendMessageCopyWithImpl<MessageEventSendMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialMessage,
    required TResult Function(String lastMessageId, int limit)
        fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) notifyNewMessage,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventFetchInitialMessages value)
        fetchInitialMessage,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
    required TResult Function(MessageEventNotifyNewMessage value)
        notifyNewMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class MessageEventSendMessage implements MessageEvent {
  const factory MessageEventSendMessage(String message) =
      _$MessageEventSendMessage;

  String get message;
  @JsonKey(ignore: true)
  $MessageEventSendMessageCopyWith<MessageEventSendMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventNotifyNewMessageCopyWith<$Res> {
  factory $MessageEventNotifyNewMessageCopyWith(
          MessageEventNotifyNewMessage value,
          $Res Function(MessageEventNotifyNewMessage) then) =
      _$MessageEventNotifyNewMessageCopyWithImpl<$Res>;
  $Res call({Message message});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$MessageEventNotifyNewMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements $MessageEventNotifyNewMessageCopyWith<$Res> {
  _$MessageEventNotifyNewMessageCopyWithImpl(
      MessageEventNotifyNewMessage _value,
      $Res Function(MessageEventNotifyNewMessage) _then)
      : super(_value, (v) => _then(v as MessageEventNotifyNewMessage));

  @override
  MessageEventNotifyNewMessage get _value =>
      super._value as MessageEventNotifyNewMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(MessageEventNotifyNewMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }

  @override
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$MessageEventNotifyNewMessage implements MessageEventNotifyNewMessage {
  const _$MessageEventNotifyNewMessage(this.message);

  @override
  final Message message;

  @override
  String toString() {
    return 'MessageEvent.notifyNewMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventNotifyNewMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $MessageEventNotifyNewMessageCopyWith<MessageEventNotifyNewMessage>
      get copyWith => _$MessageEventNotifyNewMessageCopyWithImpl<
          MessageEventNotifyNewMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialMessage,
    required TResult Function(String lastMessageId, int limit)
        fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
    required TResult Function(Message message) notifyNewMessage,
  }) {
    return notifyNewMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
  }) {
    return notifyNewMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialMessage,
    TResult Function(String lastMessageId, int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    TResult Function(Message message)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (notifyNewMessage != null) {
      return notifyNewMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventFetchInitialMessages value)
        fetchInitialMessage,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
    required TResult Function(MessageEventNotifyNewMessage value)
        notifyNewMessage,
  }) {
    return notifyNewMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
  }) {
    return notifyNewMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventFetchInitialMessages value)?
        fetchInitialMessage,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    TResult Function(MessageEventNotifyNewMessage value)? notifyNewMessage,
    required TResult orElse(),
  }) {
    if (notifyNewMessage != null) {
      return notifyNewMessage(this);
    }
    return orElse();
  }
}

abstract class MessageEventNotifyNewMessage implements MessageEvent {
  const factory MessageEventNotifyNewMessage(Message message) =
      _$MessageEventNotifyNewMessage;

  Message get message;
  @JsonKey(ignore: true)
  $MessageEventNotifyNewMessageCopyWith<MessageEventNotifyNewMessage>
      get copyWith => throw _privateConstructorUsedError;
}
