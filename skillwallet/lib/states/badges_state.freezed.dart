// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'badges_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BadgesStateTearOff {
  const _$BadgesStateTearOff();

  Nothing call() {
    return const Nothing();
  }

  Loading loading() {
    return const Loading();
  }

  BadgesData loaded({required List<BadgesModel?>? badgesList}) {
    return BadgesData(
      badgesList: badgesList,
    );
  }

  BadgesError error() {
    return const BadgesError();
  }
}

/// @nodoc
const $BadgesState = _$BadgesStateTearOff();

/// @nodoc
mixin _$BadgesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() loading,
    required TResult Function(List<BadgesModel?>? badgesList) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Nothing value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(BadgesData value) loaded,
    required TResult Function(BadgesError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgesStateCopyWith<$Res> {
  factory $BadgesStateCopyWith(
          BadgesState value, $Res Function(BadgesState) then) =
      _$BadgesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BadgesStateCopyWithImpl<$Res> implements $BadgesStateCopyWith<$Res> {
  _$BadgesStateCopyWithImpl(this._value, this._then);

  final BadgesState _value;
  // ignore: unused_field
  final $Res Function(BadgesState) _then;
}

/// @nodoc
abstract class $NothingCopyWith<$Res> {
  factory $NothingCopyWith(Nothing value, $Res Function(Nothing) then) =
      _$NothingCopyWithImpl<$Res>;
}

/// @nodoc
class _$NothingCopyWithImpl<$Res> extends _$BadgesStateCopyWithImpl<$Res>
    implements $NothingCopyWith<$Res> {
  _$NothingCopyWithImpl(Nothing _value, $Res Function(Nothing) _then)
      : super(_value, (v) => _then(v as Nothing));

  @override
  Nothing get _value => super._value as Nothing;
}

/// @nodoc

class _$Nothing implements Nothing {
  const _$Nothing();

  @override
  String toString() {
    return 'BadgesState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Nothing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() loading,
    required TResult Function(List<BadgesModel?>? badgesList) loaded,
    required TResult Function() error,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Nothing value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(BadgesData value) loaded,
    required TResult Function(BadgesError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Nothing implements BadgesState {
  const factory Nothing() = _$Nothing;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$BadgesStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'BadgesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() loading,
    required TResult Function(List<BadgesModel?>? badgesList) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Nothing value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(BadgesData value) loaded,
    required TResult Function(BadgesError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements BadgesState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $BadgesDataCopyWith<$Res> {
  factory $BadgesDataCopyWith(
          BadgesData value, $Res Function(BadgesData) then) =
      _$BadgesDataCopyWithImpl<$Res>;
  $Res call({List<BadgesModel?>? badgesList});
}

/// @nodoc
class _$BadgesDataCopyWithImpl<$Res> extends _$BadgesStateCopyWithImpl<$Res>
    implements $BadgesDataCopyWith<$Res> {
  _$BadgesDataCopyWithImpl(BadgesData _value, $Res Function(BadgesData) _then)
      : super(_value, (v) => _then(v as BadgesData));

  @override
  BadgesData get _value => super._value as BadgesData;

  @override
  $Res call({
    Object? badgesList = freezed,
  }) {
    return _then(BadgesData(
      badgesList: badgesList == freezed
          ? _value.badgesList
          : badgesList // ignore: cast_nullable_to_non_nullable
              as List<BadgesModel?>?,
    ));
  }
}

/// @nodoc

class _$BadgesData implements BadgesData {
  const _$BadgesData({required this.badgesList});

  @override
  final List<BadgesModel?>? badgesList;

  @override
  String toString() {
    return 'BadgesState.loaded(badgesList: $badgesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BadgesData &&
            (identical(other.badgesList, badgesList) ||
                const DeepCollectionEquality()
                    .equals(other.badgesList, badgesList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(badgesList);

  @JsonKey(ignore: true)
  @override
  $BadgesDataCopyWith<BadgesData> get copyWith =>
      _$BadgesDataCopyWithImpl<BadgesData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() loading,
    required TResult Function(List<BadgesModel?>? badgesList) loaded,
    required TResult Function() error,
  }) {
    return loaded(badgesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
  }) {
    return loaded?.call(badgesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(badgesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Nothing value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(BadgesData value) loaded,
    required TResult Function(BadgesError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BadgesData implements BadgesState {
  const factory BadgesData({required List<BadgesModel?>? badgesList}) =
      _$BadgesData;

  List<BadgesModel?>? get badgesList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgesDataCopyWith<BadgesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgesErrorCopyWith<$Res> {
  factory $BadgesErrorCopyWith(
          BadgesError value, $Res Function(BadgesError) then) =
      _$BadgesErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$BadgesErrorCopyWithImpl<$Res> extends _$BadgesStateCopyWithImpl<$Res>
    implements $BadgesErrorCopyWith<$Res> {
  _$BadgesErrorCopyWithImpl(
      BadgesError _value, $Res Function(BadgesError) _then)
      : super(_value, (v) => _then(v as BadgesError));

  @override
  BadgesError get _value => super._value as BadgesError;
}

/// @nodoc

class _$BadgesError implements BadgesError {
  const _$BadgesError();

  @override
  String toString() {
    return 'BadgesState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BadgesError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() loading,
    required TResult Function(List<BadgesModel?>? badgesList) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? loading,
    TResult Function(List<BadgesModel?>? badgesList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Nothing value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(BadgesData value) loaded,
    required TResult Function(BadgesError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Nothing value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(BadgesData value)? loaded,
    TResult Function(BadgesError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BadgesError implements BadgesState {
  const factory BadgesError() = _$BadgesError;
}
