import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../3_application/3_notifiers/memo_list_notifier.dart';
import '../1_widgets/3_organisms/memo_list_view.dart';
import '../1_widgets/2_molecules/memo_search_bar.dart';
import '../1_widgets/1_atoms/loading_indicator.dart';
import '../1_widgets/1_atoms/error_display.dart';

/// メモ一覧画面
/// 
/// アプリケーションのメイン画面として、
/// 全てのメモの一覧表示、検索、新規作成への遷移を提供します。
class MemoListPage extends HookConsumerWidget {
  const MemoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 状態の購読
    final memoListState = ref.watch(memoListNotifierProvider);
    
    // 検索クエリの管理
    final searchController = useTextEditingController();
    final searchQuery = useState<String>('');

    // ライフサイクル管理: 画面初期化時にメモ一覧を取得
    useEffect(() {
      Future.microtask(() {
        ref.read(memoListNotifierProvider.notifier).getAllMemos();
      });
      return null;
    }, const []);

    // 検索クエリの変更を監視
    useEffect(() {
      final timer = Timer(const Duration(milliseconds: 500), () {
        if (searchQuery.value.isNotEmpty) {
          ref.read(memoListNotifierProvider.notifier).searchMemos(searchQuery.value);
        } else {
          ref.read(memoListNotifierProvider.notifier).getAllMemos();
        }
      });
      return timer.cancel;
    }, [searchQuery.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ一覧'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        
      ),
      body: Column(
        children: [
          // 検索バー
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MemoSearchBar(
              onSearchChanged: (query) => searchQuery.value = query,
              onSearchCleared: () {
                searchController.clear();
                searchQuery.value = '';
              },
              initialSearchText: searchController.text,
            ),
          ),
          // メモ一覧
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => _refreshMemos(ref),
              child: memoListState.when(
                initial: () => const Center(
                  child: Text(
                    'メモを読み込み中...',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                loading: () => const Center(
                  child: LoadingIndicator(),
                ),
                loaded: (memos) {
                  if (memos.isEmpty) {
                    return _buildEmptyState(context, searchQuery.value.isNotEmpty);
                  }
                  return MemoListView(
                    memos: memos,
                    onMemoTap: (memo) => _navigateToMemoDetail(context, memo.id),
                    onMemoEdit: (memo) => _navigateToMemoEdit(context, memo.id),
                    onMemoDelete: (memo) => _showDeleteConfirmation(context, ref, memo),
                  );
                },
                error: (message) => Center(
                  child: ErrorDisplay(
                    message: message,
                    onRetry: () => _retryLoadMemos(ref),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToMemoCreate(context),
        tooltip: '新しいメモを作成',
        child: const Icon(Icons.add),
      ),
    );
  }

  /// 空の状態を表示するウィジェット
  Widget _buildEmptyState(BuildContext context, bool isSearching) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSearching ? Icons.search_off : Icons.note_add,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            isSearching ? '検索結果が見つかりません' : 'メモがありません',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isSearching 
                ? '別のキーワードで検索してみてください'
                : '右下のボタンから新しいメモを作成できます',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
            textAlign: TextAlign.center,
          ),
          if (!isSearching) ...[
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _navigateToMemoCreate(context),
              icon: const Icon(Icons.add),
              label: const Text('メモを作成'),
            ),
          ]
        ],
      ),
    );
  }

  /// メモ一覧の再読み込み
  Future<void> _refreshMemos(WidgetRef ref) async {
    await ref.read(memoListNotifierProvider.notifier).refresh();
  }

  /// メモ読み込みのリトライ
  void _retryLoadMemos(WidgetRef ref) {
    ref.read(memoListNotifierProvider.notifier).getAllMemos();
  }

  /// メモ詳細画面への遷移
  void _navigateToMemoDetail(BuildContext context, String memoId) {
    context.push('/memos/$memoId');
  }

  /// メモ編集画面への遷移（詳細画面に遷移して編集モードで開く）
  void _navigateToMemoEdit(BuildContext context, String memoId) {
    context.push('/memos/$memoId?edit=true');
  }

  /// メモ作成画面への遷移
  void _navigateToMemoCreate(BuildContext context) {
    context.push('/memos/create');
  }

  /// メモ削除確認ダイアログの表示
  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    dynamic memo, // MemoEntityの型を使用
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('メモを削除'),
        content: Text('「${memo.title}」を削除しますか？\nこの操作は取り消せません。'),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('削除'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      _deleteMemo(context, ref, memo.id);
    }
  }

  /// メモ削除処理
  void _deleteMemo(BuildContext context, WidgetRef ref, String memoId) {
    ref.read(memoListNotifierProvider.notifier).removeMemo(memoId);
    
    // 削除成功のスナックバーを表示
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('メモを削除しました'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}