import '../../../../../../../core/database/app_database.dart';
import '../../1_models/memo_model.dart';
import 'memo_local_data_source.dart';
import 'exceptions/local_data_source_exceptions.dart';

/// Driftを使用したメモのローカルデータソース実装
class MemoLocalDataSourceImpl implements MemoLocalDataSource {
  final AppDatabase _database;
  
  const MemoLocalDataSourceImpl(this._database);

  @override
  Future<MemoModel?> getMemo(String id) async {
    try {
      final memo = await _database.getMemoById(id);
      if (memo == null) return null;
      
      return MemoModel(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      );
    } catch (e) {
      throw LocalDataSourceException(
        'メモの取得に失敗しました',
        code: 'GET_MEMO_ERROR',
        details: {'id': id, 'error': e.toString()},
      );
    }
  }

  @override
  Future<List<MemoModel>> getAllMemos() async {
    try {
      final memos = await _database.getAllMemos();
      return memos.map((memo) => MemoModel(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      )).toList();
    } catch (e) {
      throw LocalDataSourceException(
        '全メモの取得に失敗しました',
        code: 'GET_ALL_MEMOS_ERROR',
        details: {'error': e.toString()},
      );
    }
  }

  @override
  Future<void> saveMemo(MemoModel memo) async {
    try {
      final companion = MemosCompanion.insert(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      );
      
      // 既存のメモがあるかチェック
      final existingMemo = await _database.getMemoById(memo.id);
      if (existingMemo != null) {
        // 更新
        await _database.updateMemo(companion);
      } else {
        // 新規作成
        await _database.createMemo(companion);
      }
    } catch (e) {
      throw LocalDataSourceException(
        'メモの保存に失敗しました',
        code: 'SAVE_MEMO_ERROR',
        details: {'memo': memo.toJson(), 'error': e.toString()},
      );
    }
  }

  @override
  Future<void> saveMemos(List<MemoModel> memos) async {
    try {
      await _database.transaction(() async {
        for (final memo in memos) {
          await saveMemo(memo);
        }
      });
    } catch (e) {
      throw LocalDataSourceException(
        'メモの一括保存に失敗しました',
        code: 'SAVE_MEMOS_ERROR',
        details: {'error': e.toString()},
      );
    }
  }

  @override
  Future<void> updateMemo(MemoModel memo) async {
    try {
      final existingMemo = await _database.getMemoById(memo.id);
      if (existingMemo == null) {
         throw LocalDataSourceException(
           '更新対象のメモが見つかりません',
           code: 'MEMO_NOT_FOUND',
           details: {'id': memo.id},
         );
       }
      
      final companion = MemosCompanion.insert(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      );
      
      await _database.updateMemo(companion);
    } catch (e) {
      if (e is LocalDataSourceException) {
        rethrow;
      }
      throw LocalDataSourceException(
         'メモの更新に失敗しました',
         code: 'UPDATE_MEMO_ERROR',
         details: {'memo': memo.toJson(), 'error': e.toString()},
       );
    }
  }

  @override
  Future<void> deleteMemo(String id) async {
    try {
      final deletedCount = await _database.deleteMemoById(id);
       if (deletedCount == 0) {
         throw LocalDataSourceException(
           '削除対象のメモが見つかりません',
           code: 'MEMO_NOT_FOUND',
           details: {'id': id},
         );
       }
    } catch (e) {
      if (e is LocalDataSourceException) {
        rethrow;
      }
      throw LocalDataSourceException(
         'メモの削除に失敗しました',
         code: 'DELETE_MEMO_ERROR',
         details: {'id': id, 'error': e.toString()},
       );
    }
  }

  @override
  Future<void> deleteAllMemos() async {
    try {
      await _database.deleteAllMemos();
    } catch (e) {
      throw LocalDataSourceException(
        '全メモの削除に失敗しました',
        code: 'DELETE_ALL_MEMOS_ERROR',
        details: {'error': e.toString()},
      );
    }
  }

  @override
  Future<bool> memoExists(String id) async {
    try {
      return await _database.memoExists(id);
    } catch (e) {
      throw LocalDataSourceException(
        'メモの存在確認に失敗しました',
        code: 'MEMO_EXISTS_ERROR',
        details: {'id': id, 'error': e.toString()},
      );
    }
  }

  @override
  Stream<List<MemoModel>> watchAllMemos() {
    return _database.watchAllMemos().map((memos) => 
      memos.map((memo) => MemoModel(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      )).toList()
    );
  }

  @override
  Stream<MemoModel?> watchMemo(String id) {
    return _database.watchMemo(id).map((memo) => 
      memo != null ? MemoModel(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      ) : null
    );
  }

  @override
  Future<List<MemoModel>> searchMemosByTitle(String query) async {
    try {
      final memos = await _database.searchMemosByTitle(query);
      return memos.map((memo) => MemoModel(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      )).toList();
    } catch (e) {
      throw LocalDataSourceException(
        'タイトル検索に失敗しました',
        code: 'SEARCH_TITLE_ERROR',
        details: {'query': query, 'error': e.toString()},
      );
    }
  }

  @override
  Future<List<MemoModel>> searchMemosByContent(String query) async {
    try {
      final memos = await _database.searchMemosByContent(query);
      return memos.map((memo) => MemoModel(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      )).toList();
    } catch (e) {
      throw LocalDataSourceException(
        '内容検索に失敗しました',
        code: 'SEARCH_CONTENT_ERROR',
        details: {'query': query, 'error': e.toString()},
      );
    }
  }

  @override
  Future<List<MemoModel>> searchMemos(String query) async {
    try {
      final memos = await _database.searchMemos(query);
      return memos.map((memo) => MemoModel(
        id: memo.id,
        title: memo.title,
        content: memo.content,
        createdAt: memo.createdAt,
        updatedAt: memo.updatedAt,
      )).toList();
    } catch (e) {
      throw LocalDataSourceException(
        'メモ検索に失敗しました',
        code: 'SEARCH_MEMOS_ERROR',
        details: {'query': query, 'error': e.toString()},
      );
    }
  }
}