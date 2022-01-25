// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'withUser':
      return MessageWithUser.fromJson(json);
    case 'pending':
      return PendingMessage.fromJson(json);
    case 'raw':
      return RawMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Message',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  MessageWithUser withUser(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required User sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required DateTime date,
      @HiveField(3)
          required String message}) {
    return MessageWithUser(
      id: id,
      sender: sender,
      date: date,
      message: message,
    );
  }

  PendingMessage pending(
      {@HiveField(1)
          required User sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required DateTime date,
      @HiveField(3)
          required String message}) {
    return PendingMessage(
      sender: sender,
      date: date,
      message: message,
    );
  }

  RawMessage raw(
      {@HiveField(0) required String id,
      @HiveField(1) required String senderRef,
      @HiveField(2) required int timestamp,
      @HiveField(3) required String message}) {
    return RawMessage(
      id: id,
      senderRef: senderRef,
      timestamp: timestamp,
      message: message,
    );
  }

  Message fromJson(Map<String, Object?> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  @HiveField(3)
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        withUser,
    required TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        pending,
    required TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String senderRef,
            @HiveField(2) int timestamp,
            @HiveField(3) String message)
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageWithUser value) withUser,
    required TResult Function(PendingMessage value) pending,
    required TResult Function(RawMessage value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call({@HiveField(3) String message});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $MessageWithUserCopyWith<$Res>
    implements $MessageCopyWith<$Res> {
  factory $MessageWithUserCopyWith(
          MessageWithUser value, $Res Function(MessageWithUser) then) =
      _$MessageWithUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          User sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          DateTime date,
      @HiveField(3)
          String message});

  $UserCopyWith<$Res> get sender;
}

/// @nodoc
class _$MessageWithUserCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements $MessageWithUserCopyWith<$Res> {
  _$MessageWithUserCopyWithImpl(
      MessageWithUser _value, $Res Function(MessageWithUser) _then)
      : super(_value, (v) => _then(v as MessageWithUser));

  @override
  MessageWithUser get _value => super._value as MessageWithUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? sender = freezed,
    Object? date = freezed,
    Object? message = freezed,
  }) {
    return _then(MessageWithUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as User,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res> get sender {
    return $UserCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageWithUser extends MessageWithUser {
  const _$MessageWithUser(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required this.date,
      @HiveField(3)
          required this.message,
      String? $type})
      : $type = $type ?? 'withUser',
        super._();

  factory _$MessageWithUser.fromJson(Map<String, dynamic> json) =>
      _$$MessageWithUserFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final User sender;
  @override
  @HiveField(2)
  @TimestampConverter()
  @JsonKey(name: 'timestamp')
  final DateTime date;
  @override
  @HiveField(3)
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.withUser(id: $id, sender: $sender, date: $date, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageWithUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.sender, sender) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(sender),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $MessageWithUserCopyWith<MessageWithUser> get copyWith =>
      _$MessageWithUserCopyWithImpl<MessageWithUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        withUser,
    required TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        pending,
    required TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String senderRef,
            @HiveField(2) int timestamp,
            @HiveField(3) String message)
        raw,
  }) {
    return withUser(id, sender, date, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
  }) {
    return withUser?.call(id, sender, date, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
    required TResult orElse(),
  }) {
    if (withUser != null) {
      return withUser(id, sender, date, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageWithUser value) withUser,
    required TResult Function(PendingMessage value) pending,
    required TResult Function(RawMessage value) raw,
  }) {
    return withUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
  }) {
    return withUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
    required TResult orElse(),
  }) {
    if (withUser != null) {
      return withUser(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageWithUserToJson(this);
  }
}

abstract class MessageWithUser extends Message {
  const factory MessageWithUser(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required User sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required DateTime date,
      @HiveField(3)
          required String message}) = _$MessageWithUser;
  const MessageWithUser._() : super._();

  factory MessageWithUser.fromJson(Map<String, dynamic> json) =
      _$MessageWithUser.fromJson;

  @HiveField(0)
  String get id;
  @HiveField(1)
  User get sender;
  @HiveField(2)
  @TimestampConverter()
  @JsonKey(name: 'timestamp')
  DateTime get date;
  @override
  @HiveField(3)
  String get message;
  @override
  @JsonKey(ignore: true)
  $MessageWithUserCopyWith<MessageWithUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingMessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory $PendingMessageCopyWith(
          PendingMessage value, $Res Function(PendingMessage) then) =
      _$PendingMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1)
          User sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          DateTime date,
      @HiveField(3)
          String message});

  $UserCopyWith<$Res> get sender;
}

/// @nodoc
class _$PendingMessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements $PendingMessageCopyWith<$Res> {
  _$PendingMessageCopyWithImpl(
      PendingMessage _value, $Res Function(PendingMessage) _then)
      : super(_value, (v) => _then(v as PendingMessage));

  @override
  PendingMessage get _value => super._value as PendingMessage;

  @override
  $Res call({
    Object? sender = freezed,
    Object? date = freezed,
    Object? message = freezed,
  }) {
    return _then(PendingMessage(
      sender: sender == freezed
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as User,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserCopyWith<$Res> get sender {
    return $UserCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingMessage extends PendingMessage {
  const _$PendingMessage(
      {@HiveField(1)
          required this.sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required this.date,
      @HiveField(3)
          required this.message,
      String? $type})
      : $type = $type ?? 'pending',
        super._();

  factory _$PendingMessage.fromJson(Map<String, dynamic> json) =>
      _$$PendingMessageFromJson(json);

  @override
  @HiveField(1)
  final User sender;
  @override
  @HiveField(2)
  @TimestampConverter()
  @JsonKey(name: 'timestamp')
  final DateTime date;
  @override
  @HiveField(3)
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.pending(sender: $sender, date: $date, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingMessage &&
            const DeepCollectionEquality().equals(other.sender, sender) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sender),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $PendingMessageCopyWith<PendingMessage> get copyWith =>
      _$PendingMessageCopyWithImpl<PendingMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        withUser,
    required TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        pending,
    required TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String senderRef,
            @HiveField(2) int timestamp,
            @HiveField(3) String message)
        raw,
  }) {
    return pending(sender, date, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
  }) {
    return pending?.call(sender, date, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(sender, date, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageWithUser value) withUser,
    required TResult Function(PendingMessage value) pending,
    required TResult Function(RawMessage value) raw,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingMessageToJson(this);
  }
}

abstract class PendingMessage extends Message {
  const factory PendingMessage(
      {@HiveField(1)
          required User sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required DateTime date,
      @HiveField(3)
          required String message}) = _$PendingMessage;
  const PendingMessage._() : super._();

  factory PendingMessage.fromJson(Map<String, dynamic> json) =
      _$PendingMessage.fromJson;

  @HiveField(1)
  User get sender;
  @HiveField(2)
  @TimestampConverter()
  @JsonKey(name: 'timestamp')
  DateTime get date;
  @override
  @HiveField(3)
  String get message;
  @override
  @JsonKey(ignore: true)
  $PendingMessageCopyWith<PendingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawMessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory $RawMessageCopyWith(
          RawMessage value, $Res Function(RawMessage) then) =
      _$RawMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String senderRef,
      @HiveField(2) int timestamp,
      @HiveField(3) String message});
}

/// @nodoc
class _$RawMessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements $RawMessageCopyWith<$Res> {
  _$RawMessageCopyWithImpl(RawMessage _value, $Res Function(RawMessage) _then)
      : super(_value, (v) => _then(v as RawMessage));

  @override
  RawMessage get _value => super._value as RawMessage;

  @override
  $Res call({
    Object? id = freezed,
    Object? senderRef = freezed,
    Object? timestamp = freezed,
    Object? message = freezed,
  }) {
    return _then(RawMessage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderRef: senderRef == freezed
          ? _value.senderRef
          : senderRef // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
class _$RawMessage extends RawMessage {
  const _$RawMessage(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.senderRef,
      @HiveField(2) required this.timestamp,
      @HiveField(3) required this.message,
      String? $type})
      : $type = $type ?? 'raw',
        super._();

  factory _$RawMessage.fromJson(Map<String, dynamic> json) =>
      _$$RawMessageFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String senderRef;
  @override
  @HiveField(2)
  final int timestamp;
  @override
  @HiveField(3)
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.raw(id: $id, senderRef: $senderRef, timestamp: $timestamp, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RawMessage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.senderRef, senderRef) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(senderRef),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $RawMessageCopyWith<RawMessage> get copyWith =>
      _$RawMessageCopyWithImpl<RawMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        withUser,
    required TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        pending,
    required TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String senderRef,
            @HiveField(2) int timestamp,
            @HiveField(3) String message)
        raw,
  }) {
    return raw(id, senderRef, timestamp, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
  }) {
    return raw?.call(id, senderRef, timestamp, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        withUser,
    TResult Function(
            @HiveField(1)
                User sender,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        pending,
    TResult Function(@HiveField(0) String id, @HiveField(1) String senderRef,
            @HiveField(2) int timestamp, @HiveField(3) String message)?
        raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(id, senderRef, timestamp, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageWithUser value) withUser,
    required TResult Function(PendingMessage value) pending,
    required TResult Function(RawMessage value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageWithUser value)? withUser,
    TResult Function(PendingMessage value)? pending,
    TResult Function(RawMessage value)? raw,
    required TResult orElse(),
  }) {
    if (raw != null) {
      return raw(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RawMessageToJson(this);
  }
}

abstract class RawMessage extends Message {
  const factory RawMessage(
      {@HiveField(0) required String id,
      @HiveField(1) required String senderRef,
      @HiveField(2) required int timestamp,
      @HiveField(3) required String message}) = _$RawMessage;
  const RawMessage._() : super._();

  factory RawMessage.fromJson(Map<String, dynamic> json) =
      _$RawMessage.fromJson;

  @HiveField(0)
  String get id;
  @HiveField(1)
  String get senderRef;
  @HiveField(2)
  int get timestamp;
  @override
  @HiveField(3)
  String get message;
  @override
  @JsonKey(ignore: true)
  $RawMessageCopyWith<RawMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
