// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoEntityImpl _$$MemoEntityImplFromJson(Map<String, dynamic> json) =>
    _$MemoEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MemoEntityImplToJson(_$MemoEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
