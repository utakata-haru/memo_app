import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../1_states/memo_state.dart';
import '../2_providers/memo_providers.dart';
import '../../1_domain/3_usecases/create_memo_usecase.dart';
import '../../1_domain/3_usecases/update_memo_usecase.dart';

part 'memo_notifier.g.dart';

/// 単一メモの状態管理を行うNotifier
/// 
/// メモの取得、作成、更新、削除などの操作を管理し、
/// 対応する状態変更をUIに提供します。
@riverpod
class MemoNotifier extends _$MemoNotifier {
  /// 初期状態を返す
  @override
  MemoState build() => const MemoState.initial();

  /// 指定されたIDのメモを取得する
  Future<void> getMemo(String memoId) async {
    // ローディング状態に変更
    state = const MemoState.loading();

    try {
      // UseCaseを実行
      final getAllMemosUseCase = ref.read(getAllMemosUseCaseProvider);
      final memos = await getAllMemosUseCase();
      
      // 指定されたIDのメモを検索
      final memo = memos.firstWhere(
        (memo) => memo.id == memoId,
        orElse: () => throw Exception('メモが見つかりません'),
      );
      
      // 成功状態に変更
      state = MemoState.loaded(memo);
    } catch (e) {
      // エラー状態に変更
      state = MemoState.error(_formatErrorMessage(e));
    }
  }

  /// 新しいメモを作成する
  Future<void> createMemo({
    required String title,
    required String content,
  }) async {
    state = const MemoState.loading();

    try {
      final createMemoUseCase = ref.read(createMemoUseCaseProvider);
      final params = CreateMemoParams(
        title: title,
        content: content,
      );
      
      final createdMemo = await createMemoUseCase(params);
      state = MemoState.loaded(createdMemo);
    } catch (e) {
      state = MemoState.error(_formatErrorMessage(e));
    }
  }

  /// メモ情報を更新する
  Future<void> updateMemo({
    required String id,
    required String title,
    required String content,
  }) async {
    // 現在の状態を保持
    final currentState = state;
    
    state = const MemoState.loading();

    try {
      final updateMemoUseCase = ref.read(updateMemoUseCaseProvider);
      final params = UpdateMemoParams(
        id: id,
        title: title,
        content: content,
      );
      final memo = await updateMemoUseCase(params);
      
      state = MemoState.loaded(memo);
    } catch (e) {
      // エラー時は前の状態に戻す
      state = currentState;
      // エラー状態に変更
      state = MemoState.error(_formatErrorMessage(e));
    }
  }

  /// メモを削除する
  Future<void> deleteMemo(String memoId) async {
    state = const MemoState.loading();

    try {
      final deleteMemoUseCase = ref.read(deleteMemoUseCaseProvider);
      await deleteMemoUseCase(memoId);
      
      // 削除成功時は初期状態に戻す
      state = const MemoState.initial();
    } catch (e) {
      state = MemoState.error(_formatErrorMessage(e));
    }
  }

  /// 状態をリセットする
  void reset() {
    state = const MemoState.initial();
  }

  /// エラーメッセージをフォーマットする
  String _formatErrorMessage(Object error) {
    if (error is Exception) {
      return error.toString().replaceFirst('Exception: ', '');
    }
    return error.toString();
  }
}