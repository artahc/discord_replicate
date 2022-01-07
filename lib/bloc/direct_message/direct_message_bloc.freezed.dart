// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'direct_message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DirectMessageEventTearOff {
  const _$DirectMessageEventTearOff();

  DirectMessageEventLoad load(String id) {
    return DirectMessageEventLoad(
      id,
    );
  }
}

/// @nodoc
const $DirectMessageEvent = _$DirectMessageEventTearOff();

/// @nodoc
mixin _$DirectMessageEvent {
  String get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageEventLoad value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageEventLoad value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageEventLoad value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DirectMessageEventCopyWith<DirectMessageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageEventCopyWith<$Res> {
  factory $DirectMessageEventCopyWith(
          DirectMessageEvent value, $Res Function(DirectMessageEvent) then) =
      _$DirectMessageEventCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$DirectMessageEventCopyWithImpl<$Res>
    implements $DirectMessageEventCopyWith<$Res> {
  _$DirectMessageEventCopyWithImpl(this._value, this._then);

  final DirectMessageEvent _value;
  // ignore: unused_field
  final $Res Function(DirectMessageEvent) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $DirectMessageEventLoadCopyWith<$Res>
    implements $DirectMessageEventCopyWith<$Res> {
  factory $DirectMessageEventLoadCopyWith(DirectMessageEventLoad value,
          $Res Function(DirectMessageEventLoad) then) =
      _$DirectMessageEventLoadCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class _$DirectMessageEventLoadCopyWithImpl<$Res>
    extends _$DirectMessageEventCopyWithImpl<$Res>
    implements $DirectMessageEventLoadCopyWith<$Res> {
  _$DirectMessageEventLoadCopyWithImpl(DirectMessageEventLoad _value,
      $Res Function(DirectMessageEventLoad) _then)
      : super(_value, (v) => _then(v as DirectMessageEventLoad));

  @override
  DirectMessageEventLoad get _value => super._value as DirectMessageEventLoad;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(DirectMessageEventLoad(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DirectMessageEventLoad implements DirectMessageEventLoad {
  const _$DirectMessageEventLoad(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'DirectMessageEvent.load(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirectMessageEventLoad &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  $DirectMessageEventLoadCopyWith<DirectMessageEventLoad> get copyWith =>
      _$DirectMessageEventLoadCopyWithImpl<DirectMessageEventLoad>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? load,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageEventLoad value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageEventLoad value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageEventLoad value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class DirectMessageEventLoad implements DirectMessageEvent {
  const factory DirectMessageEventLoad(String id) = _$DirectMessageEventLoad;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  $DirectMessageEventLoadCopyWith<DirectMessageEventLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DirectMessageStateTearOff {
  const _$DirectMessageStateTearOff();

  DirectMessageStateInitial initial() {
    return const DirectMessageStateInitial();
  }

  DirectMessageStateLoadInProgress loadInProgress() {
    return const DirectMessageStateLoadInProgress();
  }

  DirectMessageStateLoadSuccess loadSuccess(Room room) {
    return DirectMessageStateLoadSuccess(
      room,
    );
  }

  DirectMessageStateLoadFailed loadFailed(Exception e) {
    return DirectMessageStateLoadFailed(
      e,
    );
  }
}

/// @nodoc
const $DirectMessageState = _$DirectMessageStateTearOff();

/// @nodoc
mixin _$DirectMessageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Room room) loadSuccess,
    required TResult Function(Exception e) loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageStateInitial value) initial,
    required TResult Function(DirectMessageStateLoadInProgress value)
        loadInProgress,
    required TResult Function(DirectMessageStateLoadSuccess value) loadSuccess,
    required TResult Function(DirectMessageStateLoadFailed value) loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageStateCopyWith<$Res> {
  factory $DirectMessageStateCopyWith(
          DirectMessageState value, $Res Function(DirectMessageState) then) =
      _$DirectMessageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateCopyWith<$Res> {
  _$DirectMessageStateCopyWithImpl(this._value, this._then);

  final DirectMessageState _value;
  // ignore: unused_field
  final $Res Function(DirectMessageState) _then;
}

/// @nodoc
abstract class $DirectMessageStateInitialCopyWith<$Res> {
  factory $DirectMessageStateInitialCopyWith(DirectMessageStateInitial value,
          $Res Function(DirectMessageStateInitial) then) =
      _$DirectMessageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageStateInitialCopyWithImpl<$Res>
    extends _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateInitialCopyWith<$Res> {
  _$DirectMessageStateInitialCopyWithImpl(DirectMessageStateInitial _value,
      $Res Function(DirectMessageStateInitial) _then)
      : super(_value, (v) => _then(v as DirectMessageStateInitial));

  @override
  DirectMessageStateInitial get _value =>
      super._value as DirectMessageStateInitial;
}

/// @nodoc

class _$DirectMessageStateInitial implements DirectMessageStateInitial {
  const _$DirectMessageStateInitial();

  @override
  String toString() {
    return 'DirectMessageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirectMessageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Room room) loadSuccess,
    required TResult Function(Exception e) loadFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
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
    required TResult Function(DirectMessageStateInitial value) initial,
    required TResult Function(DirectMessageStateLoadInProgress value)
        loadInProgress,
    required TResult Function(DirectMessageStateLoadSuccess value) loadSuccess,
    required TResult Function(DirectMessageStateLoadFailed value) loadFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DirectMessageStateInitial implements DirectMessageState {
  const factory DirectMessageStateInitial() = _$DirectMessageStateInitial;
}

/// @nodoc
abstract class $DirectMessageStateLoadInProgressCopyWith<$Res> {
  factory $DirectMessageStateLoadInProgressCopyWith(
          DirectMessageStateLoadInProgress value,
          $Res Function(DirectMessageStateLoadInProgress) then) =
      _$DirectMessageStateLoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectMessageStateLoadInProgressCopyWithImpl<$Res>
    extends _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateLoadInProgressCopyWith<$Res> {
  _$DirectMessageStateLoadInProgressCopyWithImpl(
      DirectMessageStateLoadInProgress _value,
      $Res Function(DirectMessageStateLoadInProgress) _then)
      : super(_value, (v) => _then(v as DirectMessageStateLoadInProgress));

  @override
  DirectMessageStateLoadInProgress get _value =>
      super._value as DirectMessageStateLoadInProgress;
}

/// @nodoc

class _$DirectMessageStateLoadInProgress
    implements DirectMessageStateLoadInProgress {
  const _$DirectMessageStateLoadInProgress();

  @override
  String toString() {
    return 'DirectMessageState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirectMessageStateLoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Room room) loadSuccess,
    required TResult Function(Exception e) loadFailed,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageStateInitial value) initial,
    required TResult Function(DirectMessageStateLoadInProgress value)
        loadInProgress,
    required TResult Function(DirectMessageStateLoadSuccess value) loadSuccess,
    required TResult Function(DirectMessageStateLoadFailed value) loadFailed,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class DirectMessageStateLoadInProgress implements DirectMessageState {
  const factory DirectMessageStateLoadInProgress() =
      _$DirectMessageStateLoadInProgress;
}

/// @nodoc
abstract class $DirectMessageStateLoadSuccessCopyWith<$Res> {
  factory $DirectMessageStateLoadSuccessCopyWith(
          DirectMessageStateLoadSuccess value,
          $Res Function(DirectMessageStateLoadSuccess) then) =
      _$DirectMessageStateLoadSuccessCopyWithImpl<$Res>;
  $Res call({Room room});
}

/// @nodoc
class _$DirectMessageStateLoadSuccessCopyWithImpl<$Res>
    extends _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateLoadSuccessCopyWith<$Res> {
  _$DirectMessageStateLoadSuccessCopyWithImpl(
      DirectMessageStateLoadSuccess _value,
      $Res Function(DirectMessageStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as DirectMessageStateLoadSuccess));

  @override
  DirectMessageStateLoadSuccess get _value =>
      super._value as DirectMessageStateLoadSuccess;

  @override
  $Res call({
    Object? room = freezed,
  }) {
    return _then(DirectMessageStateLoadSuccess(
      room == freezed
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

class _$DirectMessageStateLoadSuccess implements DirectMessageStateLoadSuccess {
  const _$DirectMessageStateLoadSuccess(this.room);

  @override
  final Room room;

  @override
  String toString() {
    return 'DirectMessageState.loadSuccess(room: $room)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirectMessageStateLoadSuccess &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  @JsonKey(ignore: true)
  @override
  $DirectMessageStateLoadSuccessCopyWith<DirectMessageStateLoadSuccess>
      get copyWith => _$DirectMessageStateLoadSuccessCopyWithImpl<
          DirectMessageStateLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Room room) loadSuccess,
    required TResult Function(Exception e) loadFailed,
  }) {
    return loadSuccess(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
  }) {
    return loadSuccess?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageStateInitial value) initial,
    required TResult Function(DirectMessageStateLoadInProgress value)
        loadInProgress,
    required TResult Function(DirectMessageStateLoadSuccess value) loadSuccess,
    required TResult Function(DirectMessageStateLoadFailed value) loadFailed,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class DirectMessageStateLoadSuccess implements DirectMessageState {
  const factory DirectMessageStateLoadSuccess(Room room) =
      _$DirectMessageStateLoadSuccess;

  Room get room;
  @JsonKey(ignore: true)
  $DirectMessageStateLoadSuccessCopyWith<DirectMessageStateLoadSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageStateLoadFailedCopyWith<$Res> {
  factory $DirectMessageStateLoadFailedCopyWith(
          DirectMessageStateLoadFailed value,
          $Res Function(DirectMessageStateLoadFailed) then) =
      _$DirectMessageStateLoadFailedCopyWithImpl<$Res>;
  $Res call({Exception e});
}

/// @nodoc
class _$DirectMessageStateLoadFailedCopyWithImpl<$Res>
    extends _$DirectMessageStateCopyWithImpl<$Res>
    implements $DirectMessageStateLoadFailedCopyWith<$Res> {
  _$DirectMessageStateLoadFailedCopyWithImpl(
      DirectMessageStateLoadFailed _value,
      $Res Function(DirectMessageStateLoadFailed) _then)
      : super(_value, (v) => _then(v as DirectMessageStateLoadFailed));

  @override
  DirectMessageStateLoadFailed get _value =>
      super._value as DirectMessageStateLoadFailed;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(DirectMessageStateLoadFailed(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$DirectMessageStateLoadFailed implements DirectMessageStateLoadFailed {
  const _$DirectMessageStateLoadFailed(this.e);

  @override
  final Exception e;

  @override
  String toString() {
    return 'DirectMessageState.loadFailed(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DirectMessageStateLoadFailed &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  $DirectMessageStateLoadFailedCopyWith<DirectMessageStateLoadFailed>
      get copyWith => _$DirectMessageStateLoadFailedCopyWithImpl<
          DirectMessageStateLoadFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(Room room) loadSuccess,
    required TResult Function(Exception e) loadFailed,
  }) {
    return loadFailed(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
  }) {
    return loadFailed?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(Room room)? loadSuccess,
    TResult Function(Exception e)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DirectMessageStateInitial value) initial,
    required TResult Function(DirectMessageStateLoadInProgress value)
        loadInProgress,
    required TResult Function(DirectMessageStateLoadSuccess value) loadSuccess,
    required TResult Function(DirectMessageStateLoadFailed value) loadFailed,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DirectMessageStateInitial value)? initial,
    TResult Function(DirectMessageStateLoadInProgress value)? loadInProgress,
    TResult Function(DirectMessageStateLoadSuccess value)? loadSuccess,
    TResult Function(DirectMessageStateLoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class DirectMessageStateLoadFailed implements DirectMessageState {
  const factory DirectMessageStateLoadFailed(Exception e) =
      _$DirectMessageStateLoadFailed;

  Exception get e;
  @JsonKey(ignore: true)
  $DirectMessageStateLoadFailedCopyWith<DirectMessageStateLoadFailed>
      get copyWith => throw _privateConstructorUsedError;
}
