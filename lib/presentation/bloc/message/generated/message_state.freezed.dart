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

  _MessageState call(
      {List<Message> messages = const <Message>[],
      List<Message> pendingMessages = const <Message>[]}) {
    return _MessageState(
      messages: messages,
      pendingMessages: pendingMessages,
    );
  }
}

/// @nodoc
const $MessageState = _$MessageStateTearOff();

/// @nodoc
mixin _$MessageState {
  List<Message> get messages => throw _privateConstructorUsedError;
  List<Message> get pendingMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res>;
  $Res call({List<Message> messages, List<Message> pendingMessages});
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res> implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  final MessageState _value;
  // ignore: unused_field
  final $Res Function(MessageState) _then;

  @override
  $Res call({
    Object? messages = freezed,
    Object? pendingMessages = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      pendingMessages: pendingMessages == freezed
          ? _value.pendingMessages
          : pendingMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$MessageStateCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$MessageStateCopyWith(
          _MessageState value, $Res Function(_MessageState) then) =
      __$MessageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Message> messages, List<Message> pendingMessages});
}

/// @nodoc
class __$MessageStateCopyWithImpl<$Res> extends _$MessageStateCopyWithImpl<$Res>
    implements _$MessageStateCopyWith<$Res> {
  __$MessageStateCopyWithImpl(
      _MessageState _value, $Res Function(_MessageState) _then)
      : super(_value, (v) => _then(v as _MessageState));

  @override
  _MessageState get _value => super._value as _MessageState;

  @override
  $Res call({
    Object? messages = freezed,
    Object? pendingMessages = freezed,
  }) {
    return _then(_MessageState(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      pendingMessages: pendingMessages == freezed
          ? _value.pendingMessages
          : pendingMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$_MessageState implements _MessageState {
  const _$_MessageState(
      {this.messages = const <Message>[],
      this.pendingMessages = const <Message>[]});

  @JsonKey()
  @override
  final List<Message> messages;
  @JsonKey()
  @override
  final List<Message> pendingMessages;

  @override
  String toString() {
    return 'MessageState(messages: $messages, pendingMessages: $pendingMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageState &&
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
  _$MessageStateCopyWith<_MessageState> get copyWith =>
      __$MessageStateCopyWithImpl<_MessageState>(this, _$identity);
}

abstract class _MessageState implements MessageState {
  const factory _MessageState(
      {List<Message> messages,
      List<Message> pendingMessages}) = _$_MessageState;

  @override
  List<Message> get messages;
  @override
  List<Message> get pendingMessages;
  @override
  @JsonKey(ignore: true)
  _$MessageStateCopyWith<_MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}
