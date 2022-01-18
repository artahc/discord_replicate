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
  return _Message.fromJson(json);
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
  @HiveField(1)
  String get senderRef => throw _privateConstructorUsedError;
  @HiveField(2)
  @TimestampConverter()
  @JsonKey(name: 'timestamp')
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(3)
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
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
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? senderRef = freezed,
    Object? date = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
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
class _$_Message implements _Message {
  _$_Message(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.senderRef,
      @HiveField(2)
      @TimestampConverter()
      @JsonKey(name: 'timestamp')
          required this.date,
      @HiveField(3)
          required this.message});

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
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  factory _Message(
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

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
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
