import '../../1_models/memo_model.dart';

/// メモのローカルデータソースインターフェース
abstract class MemoLocalDataSource {
  /// 指定されたIDのメモを取得
  Future<MemoModel?> getMemo(String id);

  /// 全てのメモを取得（作成日時の降順）
  Future<List<MemoModel>> getAllMemos();

  /// メモを保存
  Future<void> saveMemo(MemoModel memo);

  /// 複数のメモを一括保存
  Future<void> saveMemos(List<MemoModel> memos);

  /// メモを更新
  Future<void> updateMemo(MemoModel memo);

  /// メモを削除
  Future<void> deleteMemo(String id);

  /// 全てのメモを削除
  Future<void> deleteAllMemos();

  /// メモの存在確認
  Future<bool> memoExists(String id);

  /// 全てのメモを監視（リアルタイム更新）
  Stream<List<MemoModel>> watchAllMemos();

  /// 指定されたメモを監視（リアルタイム更新）
  Stream<MemoModel?> watchMemo(String id);

  /// タイトルで検索
  Future<List<MemoModel>> searchMemosByTitle(String query);

  /// 内容で検索
  Future<List<MemoModel>> searchMemosByContent(String query);

  /// タイトルまたは内容で検索
  Future<List<MemoModel>> searchMemos(String query);
}