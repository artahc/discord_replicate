// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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

  MessageEventNewMessageNotification notifyNewMessage(Message message) {
    return MessageEventNewMessageNotification(
      message,
    );
  }

  MessageEventRefresh refresh(
      List<Message> messages, List<Message> pendingMessages) {
    return MessageEventRefresh(
      messages,
      pendingMessages,
    );
  }

  MessageEventFetchPreviousMessage fetchPreviousMessage(int limit) {
    return MessageEventFetchPreviousMessage(
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
}

/// @nodoc
const $MessageEvent = _$MessageEventTearOff();

/// @nodoc
mixin _$MessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message) notifyNewMessage,
    required TResult Function(
            List<Message> messages, List<Message> pendingMessages)
        refresh,
    required TResult Function(int limit) fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventNewMessageNotification value)
        notifyNewMessage,
    required TResult Function(MessageEventRefresh value) refresh,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
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
abstract class $MessageEventNewMessageNotificationCopyWith<$Res> {
  factory $MessageEventNewMessageNotificationCopyWith(
          MessageEventNewMessageNotification value,
          $Res Function(MessageEventNewMessageNotification) then) =
      _$MessageEventNewMessageNotificationCopyWithImpl<$Res>;
  $Res call({Message message});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$MessageEventNewMessageNotificationCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements $MessageEventNewMessageNotificationCopyWith<$Res> {
  _$MessageEventNewMessageNotificationCopyWithImpl(
      MessageEventNewMessageNotification _value,
      $Res Function(MessageEventNewMessageNotification) _then)
      : super(_value, (v) => _then(v as MessageEventNewMessageNotification));

  @override
  MessageEventNewMessageNotification get _value =>
      super._value as MessageEventNewMessageNotification;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(MessageEventNewMessageNotification(
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

class _$MessageEventNewMessageNotification
    implements MessageEventNewMessageNotification {
  const _$MessageEventNewMessageNotification(this.message);

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
            other is MessageEventNewMessageNotification &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $MessageEventNewMessageNotificationCopyWith<
          MessageEventNewMessageNotification>
      get copyWith => _$MessageEventNewMessageNotificationCopyWithImpl<
          MessageEventNewMessageNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message) notifyNewMessage,
    required TResult Function(
            List<Message> messages, List<Message> pendingMessages)
        refresh,
    required TResult Function(int limit) fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return notifyNewMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
  }) {
    return notifyNewMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
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
    required TResult Function(MessageEventNewMessageNotification value)
        notifyNewMessage,
    required TResult Function(MessageEventRefresh value) refresh,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
  }) {
    return notifyNewMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
  }) {
    return notifyNewMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (notifyNewMessage != null) {
      return notifyNewMessage(this);
    }
    return orElse();
  }
}

abstract class MessageEventNewMessageNotification implements MessageEvent {
  const factory MessageEventNewMessageNotification(Message message) =
      _$MessageEventNewMessageNotification;

  Message get message;
  @JsonKey(ignore: true)
  $MessageEventNewMessageNotificationCopyWith<
          MessageEventNewMessageNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventRefreshCopyWith<$Res> {
  factory $MessageEventRefreshCopyWith(
          MessageEventRefresh value, $Res Function(MessageEventRefresh) then) =
      _$MessageEventRefreshCopyWithImpl<$Res>;
  $Res call({List<Message> messages, List<Message> pendingMessages});
}

/// @nodoc
class _$MessageEventRefreshCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements $MessageEventRefreshCopyWith<$Res> {
  _$MessageEventRefreshCopyWithImpl(
      MessageEventRefresh _value, $Res Function(MessageEventRefresh) _then)
      : super(_value, (v) => _then(v as MessageEventRefresh));

  @override
  MessageEventRefresh get _value => super._value as MessageEventRefresh;

  @override
  $Res call({
    Object? messages = freezed,
    Object? pendingMessages = freezed,
  }) {
    return _then(MessageEventRefresh(
      messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      pendingMessages == freezed
          ? _value.pendingMessages
          : pendingMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$MessageEventRefresh implements MessageEventRefresh {
  const _$MessageEventRefresh(this.messages, this.pendingMessages);

  @override
  final List<Message> messages;
  @override
  final List<Message> pendingMessages;

  @override
  String toString() {
    return 'MessageEvent.refresh(messages: $messages, pendingMessages: $pendingMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventRefresh &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality()
                .equals(other.pendingMessages, pendingMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(pendingMessages));

  @JsonKey(ignore: true)
  @override
  $MessageEventRefreshCopyWith<MessageEventRefresh> get copyWith =>
      _$MessageEventRefreshCopyWithImpl<MessageEventRefresh>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message) notifyNewMessage,
    required TResult Function(
            List<Message> messages, List<Message> pendingMessages)
        refresh,
    required TResult Function(int limit) fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return refresh(messages, pendingMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
  }) {
    return refresh?.call(messages, pendingMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(messages, pendingMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventNewMessageNotification value)
        notifyNewMessage,
    required TResult Function(MessageEventRefresh value) refresh,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class MessageEventRefresh implements MessageEvent {
  const factory MessageEventRefresh(
          List<Message> messages, List<Message> pendingMessages) =
      _$MessageEventRefresh;

  List<Message> get messages;
  List<Message> get pendingMessages;
  @JsonKey(ignore: true)
  $MessageEventRefreshCopyWith<MessageEventRefresh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventFetchPreviousMessageCopyWith<$Res> {
  factory $MessageEventFetchPreviousMessageCopyWith(
          MessageEventFetchPreviousMessage value,
          $Res Function(MessageEventFetchPreviousMessage) then) =
      _$MessageEventFetchPreviousMessageCopyWithImpl<$Res>;
  $Res call({int limit});
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
    Object? limit = freezed,
  }) {
    return _then(MessageEventFetchPreviousMessage(
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
  const _$MessageEventFetchPreviousMessage(this.limit);

  @override
  final int limit;

  @override
  String toString() {
    return 'MessageEvent.fetchPreviousMessage(limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageEventFetchPreviousMessage &&
            const DeepCollectionEquality().equals(other.limit, limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(limit));

  @JsonKey(ignore: true)
  @override
  $MessageEventFetchPreviousMessageCopyWith<MessageEventFetchPreviousMessage>
      get copyWith => _$MessageEventFetchPreviousMessageCopyWithImpl<
          MessageEventFetchPreviousMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Message message) notifyNewMessage,
    required TResult Function(
            List<Message> messages, List<Message> pendingMessages)
        refresh,
    required TResult Function(int limit) fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return fetchPreviousMessage(limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
  }) {
    return fetchPreviousMessage?.call(limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) {
    if (fetchPreviousMessage != null) {
      return fetchPreviousMessage(limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageEventNewMessageNotification value)
        notifyNewMessage,
    required TResult Function(MessageEventRefresh value) refresh,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
  }) {
    return fetchPreviousMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
  }) {
    return fetchPreviousMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (fetchPreviousMessage != null) {
      return fetchPreviousMessage(this);
    }
    return orElse();
  }
}

abstract class MessageEventFetchPreviousMessage implements MessageEvent {
  const factory MessageEventFetchPreviousMessage(int limit) =
      _$MessageEventFetchPreviousMessage;

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
    required TResult Function(Message message) notifyNewMessage,
    required TResult Function(
            List<Message> messages, List<Message> pendingMessages)
        refresh,
    required TResult Function(int limit) fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return fetchLatestMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
  }) {
    return fetchLatestMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
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
    required TResult Function(MessageEventNewMessageNotification value)
        notifyNewMessage,
    required TResult Function(MessageEventRefresh value) refresh,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
  }) {
    return fetchLatestMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
  }) {
    return fetchLatestMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
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
    required TResult Function(Message message) notifyNewMessage,
    required TResult Function(
            List<Message> messages, List<Message> pendingMessages)
        refresh,
    required TResult Function(int limit) fetchPreviousMessage,
    required TResult Function() fetchLatestMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Message message)? notifyNewMessage,
    TResult Function(List<Message> messages, List<Message> pendingMessages)?
        refresh,
    TResult Function(int limit)? fetchPreviousMessage,
    TResult Function()? fetchLatestMessage,
    TResult Function(String message)? sendMessage,
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
    required TResult Function(MessageEventNewMessageNotification value)
        notifyNewMessage,
    required TResult Function(MessageEventRefresh value) refresh,
    required TResult Function(MessageEventFetchPreviousMessage value)
        fetchPreviousMessage,
    required TResult Function(MessageEventFetchLatestMessage value)
        fetchLatestMessage,
    required TResult Function(MessageEventSendMessage value) sendMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageEventNewMessageNotification value)?
        notifyNewMessage,
    TResult Function(MessageEventRefresh value)? refresh,
    TResult Function(MessageEventFetchPreviousMessage value)?
        fetchPreviousMessage,
    TResult Function(MessageEventFetchLatestMessage value)? fetchLatestMessage,
    TResult Function(MessageEventSendMessage value)? sendMessage,
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
