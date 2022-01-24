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
    case 'default':
      return _Message.fromJson(json);
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

  _Message call(
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
    return _Message(
      id: id,
      sender: sender,
      date: date,
      message: message,
    );
  }

  RawMessage raw(
      {required String id,
      required String senderRef,
      required int timestamp,
      required String message}) {
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
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(3)
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
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
                String message)
        $default, {
    required TResult Function(
            String id, String senderRef, int timestamp, String message)
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
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
        $default, {
    TResult Function(
            String id, String senderRef, int timestamp, String message)?
        raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
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
        $default, {
    TResult Function(
            String id, String senderRef, int timestamp, String message)?
        raw,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Message value) $default, {
    required TResult Function(RawMessage value) raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(RawMessage value)? raw,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
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
  $Res call({@HiveField(0) String id, @HiveField(3) String message});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
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
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? id = freezed,
    Object? sender = freezed,
    Object? date = freezed,
    Object? message = freezed,
  }) {
    return _then(_Message(
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
@HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
class _$_Message extends _Message {
  const _$_Message(
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
      : $type = $type ?? 'default',
        super._();

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

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
    return 'Message(id: $id, sender: $sender, date: $date, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
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
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
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
                String message)
        $default, {
    required TResult Function(
            String id, String senderRef, int timestamp, String message)
        raw,
  }) {
    return $default(id, sender, date, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
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
        $default, {
    TResult Function(
            String id, String senderRef, int timestamp, String message)?
        raw,
  }) {
    return $default?.call(id, sender, date, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
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
        $default, {
    TResult Function(
            String id, String senderRef, int timestamp, String message)?
        raw,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, sender, date, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Message value) $default, {
    required TResult Function(RawMessage value) raw,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(RawMessage value)? raw,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(RawMessage value)? raw,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(this);
  }
}

abstract class _Message extends Message {
  const factory _Message(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required User sender,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required DateTime date,
      @HiveField(3)
          required String message}) = _$_Message;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
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
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawMessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory $RawMessageCopyWith(
          RawMessage value, $Res Function(RawMessage) then) =
      _$RawMessageCopyWithImpl<$Res>;
  @override
  $Res call({String id, String senderRef, int timestamp, String message});
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
class _$RawMessage extends RawMessage {
  const _$RawMessage(
      {required this.id,
      required this.senderRef,
      required this.timestamp,
      required this.message,
      String? $type})
      : $type = $type ?? 'raw',
        super._();

  factory _$RawMessage.fromJson(Map<String, dynamic> json) =>
      _$$RawMessageFromJson(json);

  @override
  final String id;
  @override
  final String senderRef;
  @override
  final int timestamp;
  @override
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
  TResult when<TResult extends Object?>(
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
                String message)
        $default, {
    required TResult Function(
            String id, String senderRef, int timestamp, String message)
        raw,
  }) {
    return raw(id, senderRef, timestamp, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
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
        $default, {
    TResult Function(
            String id, String senderRef, int timestamp, String message)?
        raw,
  }) {
    return raw?.call(id, senderRef, timestamp, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
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
        $default, {
    TResult Function(
            String id, String senderRef, int timestamp, String message)?
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
  TResult map<TResult extends Object?>(
    TResult Function(_Message value) $default, {
    required TResult Function(RawMessage value) raw,
  }) {
    return raw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(RawMessage value)? raw,
  }) {
    return raw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
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
      {required String id,
      required String senderRef,
      required int timestamp,
      required String message}) = _$RawMessage;
  const RawMessage._() : super._();

  factory RawMessage.fromJson(Map<String, dynamic> json) =
      _$RawMessage.fromJson;

  @override
  String get id;
  String get senderRef;
  int get timestamp;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  $RawMessageCopyWith<RawMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
