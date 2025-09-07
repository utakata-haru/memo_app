// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MemoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MemoEntity memo) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MemoEntity memo)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MemoEntity memo)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoStateInitial value) initial,
    required TResult Function(MemoStateLoading value) loading,
    required TResult Function(MemoStateLoaded value) loaded,
    required TResult Function(MemoStateError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemoStateInitial value)? initial,
    TResult? Function(MemoStateLoading value)? loading,
    TResult? Function(MemoStateLoaded value)? loaded,
    TResult? Function(MemoStateError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoStateInitial value)? initial,
    TResult Function(MemoStateLoading value)? loading,
    TResult Function(MemoStateLoaded value)? loaded,
    TResult Function(MemoStateError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoStateCopyWith<$Res> {
  factory $MemoStateCopyWith(MemoState value, $Res Function(MemoState) then) =
      _$MemoStateCopyWithImpl<$Res, MemoState>;
}

/// @nodoc
class _$MemoStateCopyWithImpl<$Res, $Val extends MemoState>
    implements $MemoStateCopyWith<$Res> {
  _$MemoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MemoStateInitialImplCopyWith<$Res> {
  factory _$$MemoStateInitialImplCopyWith(
    _$MemoStateInitialImpl value,
    $Res Function(_$MemoStateInitialImpl) then,
  ) = __$$MemoStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemoStateInitialImplCopyWithImpl<$Res>
    extends _$MemoStateCopyWithImpl<$Res, _$MemoStateInitialImpl>
    implements _$$MemoStateInitialImplCopyWith<$Res> {
  __$$MemoStateInitialImplCopyWithImpl(
    _$MemoStateInitialImpl _value,
    $Res Function(_$MemoStateInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MemoStateInitialImpl implements MemoStateInitial {
  const _$MemoStateInitialImpl();

  @override
  String toString() {
    return 'MemoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemoStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MemoEntity memo) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MemoEntity memo)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MemoEntity memo)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(MemoStateInitial value) initial,
    required TResult Function(MemoStateLoading value) loading,
    required TResult Function(MemoStateLoaded value) loaded,
    required TResult Function(MemoStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemoStateInitial value)? initial,
    TResult? Function(MemoStateLoading value)? loading,
    TResult? Function(MemoStateLoaded value)? loaded,
    TResult? Function(MemoStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoStateInitial value)? initial,
    TResult Function(MemoStateLoading value)? loading,
    TResult Function(MemoStateLoaded value)? loaded,
    TResult Function(MemoStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MemoStateInitial implements MemoState {
  const factory MemoStateInitial() = _$MemoStateInitialImpl;
}

/// @nodoc
abstract class _$$MemoStateLoadingImplCopyWith<$Res> {
  factory _$$MemoStateLoadingImplCopyWith(
    _$MemoStateLoadingImpl value,
    $Res Function(_$MemoStateLoadingImpl) then,
  ) = __$$MemoStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemoStateLoadingImplCopyWithImpl<$Res>
    extends _$MemoStateCopyWithImpl<$Res, _$MemoStateLoadingImpl>
    implements _$$MemoStateLoadingImplCopyWith<$Res> {
  __$$MemoStateLoadingImplCopyWithImpl(
    _$MemoStateLoadingImpl _value,
    $Res Function(_$MemoStateLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MemoStateLoadingImpl implements MemoStateLoading {
  const _$MemoStateLoadingImpl();

  @override
  String toString() {
    return 'MemoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemoStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MemoEntity memo) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MemoEntity memo)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MemoEntity memo)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoStateInitial value) initial,
    required TResult Function(MemoStateLoading value) loading,
    required TResult Function(MemoStateLoaded value) loaded,
    required TResult Function(MemoStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemoStateInitial value)? initial,
    TResult? Function(MemoStateLoading value)? loading,
    TResult? Function(MemoStateLoaded value)? loaded,
    TResult? Function(MemoStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoStateInitial value)? initial,
    TResult Function(MemoStateLoading value)? loading,
    TResult Function(MemoStateLoaded value)? loaded,
    TResult Function(MemoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MemoStateLoading implements MemoState {
  const factory MemoStateLoading() = _$MemoStateLoadingImpl;
}

/// @nodoc
abstract class _$$MemoStateLoadedImplCopyWith<$Res> {
  factory _$$MemoStateLoadedImplCopyWith(
    _$MemoStateLoadedImpl value,
    $Res Function(_$MemoStateLoadedImpl) then,
  ) = __$$MemoStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MemoEntity memo});

  $MemoEntityCopyWith<$Res> get memo;
}

/// @nodoc
class __$$MemoStateLoadedImplCopyWithImpl<$Res>
    extends _$MemoStateCopyWithImpl<$Res, _$MemoStateLoadedImpl>
    implements _$$MemoStateLoadedImplCopyWith<$Res> {
  __$$MemoStateLoadedImplCopyWithImpl(
    _$MemoStateLoadedImpl _value,
    $Res Function(_$MemoStateLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? memo = null}) {
    return _then(
      _$MemoStateLoadedImpl(
        null == memo
            ? _value.memo
            : memo // ignore: cast_nullable_to_non_nullable
                  as MemoEntity,
      ),
    );
  }

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemoEntityCopyWith<$Res> get memo {
    return $MemoEntityCopyWith<$Res>(_value.memo, (value) {
      return _then(_value.copyWith(memo: value));
    });
  }
}

/// @nodoc

class _$MemoStateLoadedImpl implements MemoStateLoaded {
  const _$MemoStateLoadedImpl(this.memo);

  @override
  final MemoEntity memo;

  @override
  String toString() {
    return 'MemoState.loaded(memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoStateLoadedImpl &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memo);

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoStateLoadedImplCopyWith<_$MemoStateLoadedImpl> get copyWith =>
      __$$MemoStateLoadedImplCopyWithImpl<_$MemoStateLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MemoEntity memo) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(memo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MemoEntity memo)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(memo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MemoEntity memo)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(memo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoStateInitial value) initial,
    required TResult Function(MemoStateLoading value) loading,
    required TResult Function(MemoStateLoaded value) loaded,
    required TResult Function(MemoStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemoStateInitial value)? initial,
    TResult? Function(MemoStateLoading value)? loading,
    TResult? Function(MemoStateLoaded value)? loaded,
    TResult? Function(MemoStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoStateInitial value)? initial,
    TResult Function(MemoStateLoading value)? loading,
    TResult Function(MemoStateLoaded value)? loaded,
    TResult Function(MemoStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MemoStateLoaded implements MemoState {
  const factory MemoStateLoaded(final MemoEntity memo) = _$MemoStateLoadedImpl;

  MemoEntity get memo;

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoStateLoadedImplCopyWith<_$MemoStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MemoStateErrorImplCopyWith<$Res> {
  factory _$$MemoStateErrorImplCopyWith(
    _$MemoStateErrorImpl value,
    $Res Function(_$MemoStateErrorImpl) then,
  ) = __$$MemoStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MemoStateErrorImplCopyWithImpl<$Res>
    extends _$MemoStateCopyWithImpl<$Res, _$MemoStateErrorImpl>
    implements _$$MemoStateErrorImplCopyWith<$Res> {
  __$$MemoStateErrorImplCopyWithImpl(
    _$MemoStateErrorImpl _value,
    $Res Function(_$MemoStateErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$MemoStateErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$MemoStateErrorImpl implements MemoStateError {
  const _$MemoStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MemoState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoStateErrorImplCopyWith<_$MemoStateErrorImpl> get copyWith =>
      __$$MemoStateErrorImplCopyWithImpl<_$MemoStateErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MemoEntity memo) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MemoEntity memo)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MemoEntity memo)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemoStateInitial value) initial,
    required TResult Function(MemoStateLoading value) loading,
    required TResult Function(MemoStateLoaded value) loaded,
    required TResult Function(MemoStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemoStateInitial value)? initial,
    TResult? Function(MemoStateLoading value)? loading,
    TResult? Function(MemoStateLoaded value)? loaded,
    TResult? Function(MemoStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemoStateInitial value)? initial,
    TResult Function(MemoStateLoading value)? loading,
    TResult Function(MemoStateLoaded value)? loaded,
    TResult Function(MemoStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MemoStateError implements MemoState {
  const factory MemoStateError(final String message) = _$MemoStateErrorImpl;

  String get message;

  /// Create a copy of MemoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoStateErrorImplCopyWith<_$MemoStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
