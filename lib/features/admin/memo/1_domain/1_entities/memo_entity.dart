import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_entity.freezed.dart';
part 'memo_entity.g.dart';

/// メモエンティティ
/// ビジネスロジックの中核となるメモオブジェクト
@freezed
class MemoEntity with _$MemoEntity {
  const MemoEntity._();
  
  const factory MemoEntity({
    required String id,
    required String title,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MemoEntity;

  /// JSONからエンティティを生成
  factory MemoEntity.fromJson(Map<String, dynamic> json) => 
      _$MemoEntityFromJson(json);

  /// 新規メモ作成用のファクトリーコンストラクター
  factory MemoEntity.create({
    required String title,
    required String content,
  }) {
    final now = DateTime.now();
    return MemoEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// タイトルのバリデーション
  bool get hasValidTitle => title.isNotEmpty && title.trim().isNotEmpty;
  
  /// コンテンツのバリデーション
  bool get hasValidContent => content.isNotEmpty;
  
  /// メモが空かどうかの判定
  bool get isEmpty => title.trim().isEmpty && content.trim().isEmpty;
  
  /// メモの文字数を取得
  int get characterCount => content.length;
  
  /// メモのバリデーション
  List<String> validate() {
    final errors = <String>[];
    
    if (!hasValidTitle) {
      errors.add('タイトルは必須です');
    }
    
    if (title.length > 100) {
      errors.add('タイトルは100文字以内で入力してください');
    }
    
    if (content.length > 10000) {
      errors.add('内容は10000文字以内で入力してください');
    }
    
    return errors;
  }
  
  /// バリデーションが通るかどうか
  bool get isValid => validate().isEmpty;
  
  /// メモを更新したコピーを作成
  MemoEntity updateContent({
    String? title,
    String? content,
  }) {
    return copyWith(
      title: title ?? this.title,
      content: content ?? this.content,
      updatedAt: DateTime.now(),
    );
  }
}