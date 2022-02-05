// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
class _$ChannelTearOff {
  const _$ChannelTearOff();

  _Channel call(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required String userGroupRef,
      @HiveField(4) List<Message> messages = const <Message>[]}) {
    return _Channel(
      id: id,
      name: name,
      userGroupRef: userGroupRef,
      messages: messages,
    );
  }

  Channel fromJson(Map<String, Object?> json) {
    return Channel.fromJson(json);
  }
}

/// @nodoc
const $Channel = _$ChannelTearOff();

/// @nodoc
mixin _$Channel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get userGroupRef =>
      throw _privateConstructorUsedError; // @HiveField(3) @Default(const <Member>[]) List<Member> members,
  @HiveField(4)
  List<Message> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String userGroupRef,
      @HiveField(4) List<Message> messages});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res> implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  final Channel _value;
  // ignore: unused_field
  final $Res Function(Channel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userGroupRef = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupRef: userGroupRef == freezed
          ? _value.userGroupRef
          : userGroupRef // ignore: cast_nullable_to_non_nullable
              as String,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$ChannelCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$ChannelCopyWith(_Channel value, $Res Function(_Channel) then) =
      __$ChannelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String userGroupRef,
      @HiveField(4) List<Message> messages});
}

/// @nodoc
class __$ChannelCopyWithImpl<$Res> extends _$ChannelCopyWithImpl<$Res>
    implements _$ChannelCopyWith<$Res> {
  __$ChannelCopyWithImpl(_Channel _value, $Res Function(_Channel) _then)
      : super(_value, (v) => _then(v as _Channel));

  @override
  _Channel get _value => super._value as _Channel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userGroupRef = freezed,
    Object? messages = freezed,
  }) {
    return _then(_Channel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupRef: userGroupRef == freezed
          ? _value.userGroupRef
          : userGroupRef // ignore: cast_nullable_to_non_nullable
              as String,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveConstants.CHANNEL_TYPE, adapterName: "ChannelAdapter")
class _$_Channel implements _Channel {
  const _$_Channel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.userGroupRef,
      @HiveField(4) this.messages = const <Message>[]});

  factory _$_Channel.fromJson(Map<String, dynamic> json) =>
      _$$_ChannelFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String userGroupRef;
  @JsonKey()
  @override // @HiveField(3) @Default(const <Member>[]) List<Member> members,
  @HiveField(4)
  final List<Message> messages;

  @override
  String toString() {
    return 'Channel(id: $id, name: $name, userGroupRef: $userGroupRef, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Channel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.userGroupRef, userGroupRef) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(userGroupRef),
      const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$ChannelCopyWith<_Channel> get copyWith =>
      __$ChannelCopyWithImpl<_Channel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChannelToJson(this);
  }
}

abstract class _Channel implements Channel {
  const factory _Channel(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required String userGroupRef,
      @HiveField(4) List<Message> messages}) = _$_Channel;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$_Channel.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get userGroupRef;
  @override // @HiveField(3) @Default(const <Member>[]) List<Member> members,
  @HiveField(4)
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$ChannelCopyWith<_Channel> get copyWith =>
      throw _privateConstructorUsedError;
}

RawChannel _$RawChannelFromJson(Map<String, dynamic> json) {
  return _RawChannel.fromJson(json);
}

/// @nodoc
class _$RawChannelTearOff {
  const _$RawChannelTearOff();

  _RawChannel call(
      {required String id,
      required String name,
      required String userGroupRef}) {
    return _RawChannel(
      id: id,
      name: name,
      userGroupRef: userGroupRef,
    );
  }

  RawChannel fromJson(Map<String, Object?> json) {
    return RawChannel.fromJson(json);
  }
}

/// @nodoc
const $RawChannel = _$RawChannelTearOff();

/// @nodoc
mixin _$RawChannel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userGroupRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RawChannelCopyWith<RawChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawChannelCopyWith<$Res> {
  factory $RawChannelCopyWith(
          RawChannel value, $Res Function(RawChannel) then) =
      _$RawChannelCopyWithImpl<$Res>;
  $Res call({String id, String name, String userGroupRef});
}

/// @nodoc
class _$RawChannelCopyWithImpl<$Res> implements $RawChannelCopyWith<$Res> {
  _$RawChannelCopyWithImpl(this._value, this._then);

  final RawChannel _value;
  // ignore: unused_field
  final $Res Function(RawChannel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userGroupRef = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupRef: userGroupRef == freezed
          ? _value.userGroupRef
          : userGroupRef // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RawChannelCopyWith<$Res> implements $RawChannelCopyWith<$Res> {
  factory _$RawChannelCopyWith(
          _RawChannel value, $Res Function(_RawChannel) then) =
      __$RawChannelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String userGroupRef});
}

/// @nodoc
class __$RawChannelCopyWithImpl<$Res> extends _$RawChannelCopyWithImpl<$Res>
    implements _$RawChannelCopyWith<$Res> {
  __$RawChannelCopyWithImpl(
      _RawChannel _value, $Res Function(_RawChannel) _then)
      : super(_value, (v) => _then(v as _RawChannel));

  @override
  _RawChannel get _value => super._value as _RawChannel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userGroupRef = freezed,
  }) {
    return _then(_RawChannel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userGroupRef: userGroupRef == freezed
          ? _value.userGroupRef
          : userGroupRef // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RawChannel implements _RawChannel {
  const _$_RawChannel(
      {required this.id, required this.name, required this.userGroupRef});

  factory _$_RawChannel.fromJson(Map<String, dynamic> json) =>
      _$$_RawChannelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String userGroupRef;

  @override
  String toString() {
    return 'RawChannel(id: $id, name: $name, userGroupRef: $userGroupRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RawChannel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.userGroupRef, userGroupRef));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(userGroupRef));

  @JsonKey(ignore: true)
  @override
  _$RawChannelCopyWith<_RawChannel> get copyWith =>
      __$RawChannelCopyWithImpl<_RawChannel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RawChannelToJson(this);
  }
}

abstract class _RawChannel implements RawChannel {
  const factory _RawChannel(
      {required String id,
      required String name,
      required String userGroupRef}) = _$_RawChannel;

  factory _RawChannel.fromJson(Map<String, dynamic> json) =
      _$_RawChannel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get userGroupRef;
  @override
  @JsonKey(ignore: true)
  _$RawChannelCopyWith<_RawChannel> get copyWith =>
      throw _privateConstructorUsedError;
}
