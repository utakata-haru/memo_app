import '../1_entities/memo_entity.dart';

/// メモリポジトリインターフェース
/// データアクセスの抽象化レイヤー
abstract class MemoRepository {
  /// 全てのメモを取得します
  /// 
  /// Returns: メモエンティティのリスト
  /// 
  /// Throws:
  /// - [DatabaseException] データベースエラーの場合
  Future<List<MemoEntity>> getAllMemos();
  
  /// 指定されたIDのメモを取得します
  /// 
  /// [id] メモID
  /// 
  /// Returns: メモエンティティ。見つからない場合はnull
  /// 
  /// Throws:
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity?> getMemoById(String id);
  
  /// メモを作成します
  /// 
  /// [memo] 作成するメモエンティティ
  /// 
  /// Returns: 作成されたメモエンティティ
  /// 
  /// Throws:
  /// - [ValidationException] バリデーションエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity> createMemo(MemoEntity memo);
  
  /// メモを更新します
  /// 
  /// [memo] 更新するメモエンティティ
  /// 
  /// Returns: 更新されたメモエンティティ
  /// 
  /// Throws:
  /// - [ValidationException] バリデーションエラーの場合
  /// - [NotFoundException] メモが見つからない場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity> updateMemo(MemoEntity memo);
  
  /// メモを削除します
  /// 
  /// [id] 削除するメモのID
  /// 
  /// Throws:
  /// - [NotFoundException] メモが見つからない場合
  /// - [DatabaseException] データベースエラーの場合
  Future<void> deleteMemo(String id);
  
  /// メモの存在確認を行います
  /// 
  /// [id] 確認するメモのID
  /// 
  /// Returns: メモが存在する場合はtrue、そうでなければfalse
  /// 
  /// Throws:
  /// - [DatabaseException] データベースエラーの場合
  Future<bool> memoExists(String id);
  
  /// タイトルでメモを検索します
  /// 
  /// [query] 検索クエリ
  /// 
  /// Returns: 検索条件に一致するメモエンティティのリスト
  /// 
  /// Throws:
  /// - [DatabaseException] データベースエラーの場合
  Future<List<MemoEntity>> searchMemosByTitle(String query);
  
  /// 内容でメモを検索します
  /// 
  /// [query] 検索クエリ
  /// 
  /// Returns: 検索条件に一致するメモエンティティのリスト
  /// 
  /// Throws:
  /// - [DatabaseException] データベースエラーの場合
  Future<List<MemoEntity>> searchMemosByContent(String query);
  
  /// メモの変更をリアルタイムで監視します
  /// 
  /// Returns: メモエンティティのリストのストリーム
  Stream<List<MemoEntity>> watchAllMemos();
  
  /// 指定されたメモの変更をリアルタイムで監視します
  /// 
  /// [id] 監視するメモのID
  /// 
  /// Returns: メモエンティティのストリーム（削除された場合はnull）
  Stream<MemoEntity?> watchMemoById(String id);
}