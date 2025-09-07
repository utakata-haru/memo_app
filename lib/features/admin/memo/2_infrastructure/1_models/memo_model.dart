import 'package:json_annotation/json_annotation.dart';
import '../../1_domain/1_entities/memo_entity.dart';

part 'memo_model.g.dart';

/// メモのAPIレスポンス/リクエスト用モデル
@JsonSerializable()
class MemoModel {
  final String id;
  final String title;
  final String content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const MemoModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  /// JSONからMemoModelを生成
  factory MemoModel.fromJson(Map<String, dynamic> json) =>
      _$MemoModelFromJson(json);

  /// MemoModelをJSONに変換
  Map<String, dynamic> toJson() => _$MemoModelToJson(this);

  /// ドメインエンティティに変換
  MemoEntity toEntity() {
    return MemoEntity(
      id: id,
      title: title,
      content: content,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// ドメインエンティティからモデルを生成
  factory MemoModel.fromEntity(MemoEntity entity) {
    return MemoModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// 新規作成用のモデルを生成（IDとタイムスタンプを自動生成）
  factory MemoModel.forCreation({
    required String title,
    required String content,
  }) {
    final now = DateTime.now();
    return MemoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 更新用のモデルを生成（updatedAtを現在時刻に更新）
  MemoModel copyWithUpdate({
    String? title,
    String? content,
  }) {
    return MemoModel(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}