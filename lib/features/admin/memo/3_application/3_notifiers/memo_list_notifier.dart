import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../1_states/memo_list_state.dart';
import '../2_providers/memo_providers.dart';
import '../../1_domain/1_entities/memo_entity.dart';

part 'memo_list_notifier.g.dart';

/// メモリストの状態管理を行うNotifier
/// 
/// メモの一覧取得、検索、リアルタイム監視などの操作を管理し、
/// 対応する状態変更をUIに提供します。
@riverpod
class MemoListNotifier extends _$MemoListNotifier {
  /// 初期状態を返す
  @override
  MemoListState build() => const MemoListState.initial();

  /// 全てのメモを取得する
  Future<void> getAllMemos() async {
    // ローディング状態に変更
    state = const MemoListState.loading();

    try {
      // UseCaseを実行
      final getAllMemosUseCase = ref.read(getAllMemosUseCaseProvider);
      final memos = await getAllMemosUseCase();
      
      // 成功状態に変更
      state = MemoListState.loaded(memos);
    } catch (e) {
      // エラー状態に変更
      state = MemoListState.error(_formatErrorMessage(e));
    }
  }

  /// メモを検索する
  Future<void> searchMemos(String query) async {
    if (query.trim().isEmpty) {
      // 空の検索クエリの場合は全件取得
      await getAllMemos();
      return;
    }

    state = const MemoListState.loading();

    try {
      // 現在は全件取得してクライアント側でフィルタリング
      // 将来的にはSearchMemosUseCaseを実装予定
      final getAllMemosUseCase = ref.read(getAllMemosUseCaseProvider);
      final allMemos = await getAllMemosUseCase();
      
      // タイトルまたは内容に検索クエリが含まれるメモをフィルタリング
      final filteredMemos = allMemos.where((memo) {
        final titleMatch = memo.title.toLowerCase().contains(query.toLowerCase());
        final contentMatch = memo.content.toLowerCase().contains(query.toLowerCase());
        return titleMatch || contentMatch;
      }).toList();
      
      state = MemoListState.loaded(filteredMemos);
    } catch (e) {
      state = MemoListState.error(_formatErrorMessage(e));
    }
  }

  /// メモリストを更新する（リフレッシュ）
  Future<void> refresh() async {
    await getAllMemos();
  }

  /// 新しいメモを追加する（リストに反映）
  void addMemo(MemoEntity memo) {
    final currentState = state;
    if (currentState is MemoListStateLoaded) {
      final updatedMemos = [...currentState.memos, memo];
      state = MemoListState.loaded(updatedMemos);
    }
  }

  /// メモを更新する（リストに反映）
  void updateMemoInList(MemoEntity updatedMemo) {
    final currentState = state;
    if (currentState is MemoListStateLoaded) {
      final updatedMemos = currentState.memos.map((memo) {
        return memo.id == updatedMemo.id ? updatedMemo : memo;
      }).toList();
      state = MemoListState.loaded(updatedMemos);
    }
  }

  /// メモを削除する（リストから除去）
  void removeMemo(String memoId) {
    final currentState = state;
    if (currentState is MemoListStateLoaded) {
      final updatedMemos = currentState.memos
          .where((memo) => memo.id != memoId)
          .toList();
      state = MemoListState.loaded(updatedMemos);
    }
  }

  /// 状態をリセットする
  void reset() {
    state = const MemoListState.initial();
  }

  /// エラーメッセージをフォーマットする
  String _formatErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}