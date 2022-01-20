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
    case 'pending':
      return _PendingMessage.fromJson(json);

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
          required String senderRef,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required DateTime date,
      @HiveField(3)
          required String message}) {
    return _Message(
      id: id,
      senderRef: senderRef,
      date: date,
      message: message,
    );
  }

  _PendingMessage pending(
      {required String senderRef,
      required String message,
      required DateTime date}) {
    return _PendingMessage(
      senderRef: senderRef,
      message: message,
      date: date,
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
  @HiveField(1)
  String get senderRef => throw _privateConstructorUsedError;
  @HiveField(2)
  @TimestampConverter()
  @JsonKey(name: 'timestamp')
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(3)
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        $default, {
    required TResult Function(String senderRef, String message, DateTime date)
        pending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        $default, {
    TResult Function(String senderRef, String message, DateTime date)? pending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        $default, {
    TResult Function(String senderRef, String message, DateTime date)? pending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Message value) $default, {
    required TResult Function(_PendingMessage value) pending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(_PendingMessage value)? pending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(_PendingMessage value)? pending,
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
  $Res call(
      {@HiveField(1)
          String senderRef,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          DateTime date,
      @HiveField(3)
          String message});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? senderRef = freezed,
    Object? date = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      senderRef: senderRef == freezed
          ? _value.senderRef
          : senderRef // ignore: cast_nullable_to_non_nullable
              as String,
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
          String senderRef,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          DateTime date,
      @HiveField(3)
          String message});
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
    Object? senderRef = freezed,
    Object? date = freezed,
    Object? message = freezed,
  }) {
    return _then(_Message(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderRef: senderRef == freezed
          ? _value.senderRef
          : senderRef // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveConstants.MESSAGE_TYPE, adapterName: "MessageAdapter")
class _$_Message extends _Message {
  const _$_Message(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.senderRef,
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
  final String senderRef;
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
    return 'Message(id: $id, senderRef: $senderRef, date: $date, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.senderRef, senderRef) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(senderRef),
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
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        $default, {
    required TResult Function(String senderRef, String message, DateTime date)
        pending,
  }) {
    return $default(id, senderRef, date, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        $default, {
    TResult Function(String senderRef, String message, DateTime date)? pending,
  }) {
    return $default?.call(id, senderRef, date, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        $default, {
    TResult Function(String senderRef, String message, DateTime date)? pending,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, senderRef, date, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Message value) $default, {
    required TResult Function(_PendingMessage value) pending,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(_PendingMessage value)? pending,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(_PendingMessage value)? pending,
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
          required String senderRef,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required DateTime date,
      @HiveField(3)
          required String message}) = _$_Message;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get senderRef;
  @override
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
abstract class _$PendingMessageCopyWith<$Res>
    implements $MessageCopyWith<$Res> {
  factory _$PendingMessageCopyWith(
          _PendingMessage value, $Res Function(_PendingMessage) then) =
      __$PendingMessageCopyWithImpl<$Res>;
  @override
  $Res call({String senderRef, String message, DateTime date});
}

/// @nodoc
class __$PendingMessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$PendingMessageCopyWith<$Res> {
  __$PendingMessageCopyWithImpl(
      _PendingMessage _value, $Res Function(_PendingMessage) _then)
      : super(_value, (v) => _then(v as _PendingMessage));

  @override
  _PendingMessage get _value => super._value as _PendingMessage;

  @override
  $Res call({
    Object? senderRef = freezed,
    Object? message = freezed,
    Object? date = freezed,
  }) {
    return _then(_PendingMessage(
      senderRef: senderRef == freezed
          ? _value.senderRef
          : senderRef // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PendingMessage extends _PendingMessage {
  const _$_PendingMessage(
      {required this.senderRef,
      required this.message,
      required this.date,
      String? $type})
      : $type = $type ?? 'pending',
        super._();

  factory _$_PendingMessage.fromJson(Map<String, dynamic> json) =>
      _$$_PendingMessageFromJson(json);

  @override
  final String senderRef;
  @override
  final String message;
  @override
  final DateTime date;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.pending(senderRef: $senderRef, message: $message, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PendingMessage &&
            const DeepCollectionEquality().equals(other.senderRef, senderRef) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(senderRef),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$PendingMessageCopyWith<_PendingMessage> get copyWith =>
      __$PendingMessageCopyWithImpl<_PendingMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)
        $default, {
    required TResult Function(String senderRef, String message, DateTime date)
        pending,
  }) {
    return pending(senderRef, message, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        $default, {
    TResult Function(String senderRef, String message, DateTime date)? pending,
  }) {
    return pending?.call(senderRef, message, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0)
                String id,
            @HiveField(1)
                String senderRef,
            @HiveField(2)
            @TimestampConverter()
            @JsonKey(name: 'timestamp')
                DateTime date,
            @HiveField(3)
                String message)?
        $default, {
    TResult Function(String senderRef, String message, DateTime date)? pending,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(senderRef, message, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Message value) $default, {
    required TResult Function(_PendingMessage value) pending,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(_PendingMessage value)? pending,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Message value)? $default, {
    TResult Function(_PendingMessage value)? pending,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_PendingMessageToJson(this);
  }
}

abstract class _PendingMessage extends Message {
  const factory _PendingMessage(
      {required String senderRef,
      required String message,
      required DateTime date}) = _$_PendingMessage;
  const _PendingMessage._() : super._();

  factory _PendingMessage.fromJson(Map<String, dynamic> json) =
      _$_PendingMessage.fromJson;

  @override
  String get senderRef;
  @override
  String get message;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$PendingMessageCopyWith<_PendingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
