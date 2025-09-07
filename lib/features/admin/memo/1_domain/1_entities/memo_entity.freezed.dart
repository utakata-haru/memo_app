// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemoEntity _$MemoEntityFromJson(Map<String, dynamic> json) {
  return _MemoEntity.fromJson(json);
}

/// @nodoc
mixin _$MemoEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MemoEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoEntityCopyWith<MemoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoEntityCopyWith<$Res> {
  factory $MemoEntityCopyWith(
    MemoEntity value,
    $Res Function(MemoEntity) then,
  ) = _$MemoEntityCopyWithImpl<$Res, MemoEntity>;
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$MemoEntityCopyWithImpl<$Res, $Val extends MemoEntity>
    implements $MemoEntityCopyWith<$Res> {
  _$MemoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemoEntityImplCopyWith<$Res>
    implements $MemoEntityCopyWith<$Res> {
  factory _$$MemoEntityImplCopyWith(
    _$MemoEntityImpl value,
    $Res Function(_$MemoEntityImpl) then,
  ) = __$$MemoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$MemoEntityImplCopyWithImpl<$Res>
    extends _$MemoEntityCopyWithImpl<$Res, _$MemoEntityImpl>
    implements _$$MemoEntityImplCopyWith<$Res> {
  __$$MemoEntityImplCopyWithImpl(
    _$MemoEntityImpl _value,
    $Res Function(_$MemoEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$MemoEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoEntityImpl extends _MemoEntity {
  const _$MemoEntityImpl({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  factory _$MemoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MemoEntity(id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, createdAt, updatedAt);

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoEntityImplCopyWith<_$MemoEntityImpl> get copyWith =>
      __$$MemoEntityImplCopyWithImpl<_$MemoEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoEntityImplToJson(this);
  }
}

abstract class _MemoEntity extends MemoEntity {
  const factory _MemoEntity({
    required final String id,
    required final String title,
    required final String content,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$MemoEntityImpl;
  const _MemoEntity._() : super._();

  factory _MemoEntity.fromJson(Map<String, dynamic> json) =
      _$MemoEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of MemoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoEntityImplCopyWith<_$MemoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
