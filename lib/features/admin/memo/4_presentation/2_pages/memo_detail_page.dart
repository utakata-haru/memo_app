import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../1_domain/1_entities/memo_entity.dart';
import '../../3_application/3_notifiers/memo_notifier.dart';
import '../../3_application/3_notifiers/memo_list_notifier.dart';
import '../1_widgets/1_atoms/loading_indicator.dart';
import '../1_widgets/1_atoms/error_display.dart';

/// メモ詳細ページ
class MemoDetailPage extends HookConsumerWidget {
  /// メモID
  final String memoId;

  const MemoDetailPage({
    super.key,
    required this.memoId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // メモの状態を監視
    final memoAsyncValue = ref.watch(memoNotifierProvider);
    
    // クエリパラメータから編集モードを判定
    final uri = Uri.parse(GoRouterState.of(context).uri.toString());
    final shouldEdit = uri.queryParameters['edit'] == 'true';
    
    // 編集モード状態
    final isEditing = useState(shouldEdit);
    
    // フォームコントローラー（編集時に使用）
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    
    // フォームキー
    final formKey = useMemoized(() => GlobalKey<FormState>());
    
    // ローディング状態
    final isLoading = useState(false);
    
    // メモデータの取得
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(memoNotifierProvider.notifier).getMemo(memoId);
      });
      return null;
    }, [memoId]);
    
    // メモデータが読み込まれた時に編集モードの場合はフォームに値を設定
    useEffect(() {
      memoAsyncValue.when(
        initial: () {},
        loading: () {},
        loaded: (memo) {
          if (isEditing.value) {
            titleController.text = memo.title;
            contentController.text = memo.content;
          }
        },
        error: (message) {},
      );
      return null;
    }, [memoAsyncValue, isEditing.value]);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing.value ? 'メモを編集' : 'メモ詳細'),
        actions: [
          if (!isEditing.value) ...[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                memoAsyncValue.when(
                  initial: () {},
                  loading: () {},
                  loaded: (memo) {
                    titleController.text = memo.title;
                    contentController.text = memo.content;
                    isEditing.value = true;
                  },
                  error: (message) {},
                );
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'delete':
                    _showDeleteConfirmation(context, ref);
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8.0),
                      Text('削除', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          ] else ...[
            TextButton(
              onPressed: () => isEditing.value = false,
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: isLoading.value
                  ? null
                  : () => _saveMemo(
                        context,
                        ref,
                        formKey,
                        titleController,
                        contentController,
                        isLoading,
                        isEditing,
                      ),
              child: const Text(
                '保存',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ],
      ),
      body: Stack(
        children: [
          memoAsyncValue.when(
            initial: () => const LoadingIndicator(
              message: '初期化中...',
            ),
            loading: () => const LoadingIndicator(
              message: 'メモを読み込み中...',
            ),
            loaded: (memo) {
              if (isEditing.value) {
                return _buildEditForm(
                  formKey,
                  titleController,
                  contentController,
                );
              } else {
                return _buildDetailView(memo);
              }
            },
            error: (message) => ErrorDisplay(
              message: 'メモの読み込みに失敗しました: $message',
              onRetry: () {
                ref.read(memoNotifierProvider.notifier).getMemo(memoId);
              },
            ),
          ),
          
          // ローディングオーバーレイ
          if (isLoading.value)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const LoadingIndicator(
                message: 'メモを保存中...',
              ),
            ),
        ],
      ),
    );
  }

  /// 詳細表示ビルド
  Widget _buildDetailView(MemoEntity memo) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // タイトル
          Text(
            memo.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          
          // 更新日時
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16.0,
                color: Colors.grey,
              ),
              const SizedBox(width: 4.0),
              Text(
                _formatDateTime(memo.updatedAt),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          
          // 内容
          Text(
            memo.content,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  /// 編集フォームビルド
  Widget _buildEditForm(
    GlobalKey<FormState> formKey,
    TextEditingController titleController,
    TextEditingController contentController,
  ) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // タイトル入力フィールド
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'タイトル',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'タイトルを入力してください';
                }
                if (value.trim().length > 100) {
                  return 'タイトルは100文字以内で入力してください';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            
            // 内容入力フィールド
            Expanded(
              child: TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: '内容',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '内容を入力してください';
                  }
                  if (value.trim().length > 10000) {
                    return '内容は10000文字以内で入力してください';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// メモを保存
  Future<void> _saveMemo(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController titleController,
    TextEditingController contentController,
    ValueNotifier<bool> isLoading,
    ValueNotifier<bool> isEditing,
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      await ref.read(memoNotifierProvider.notifier).updateMemo(
        id: memoId,
        title: titleController.text.trim(),
        content: contentController.text.trim(),
      );

      if (context.mounted) {
        isEditing.value = false;
        
        // メモ一覧の状態を自動更新
        ref.read(memoListNotifierProvider.notifier).getAllMemos();
        
        // 成功メッセージを表示
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('メモを更新しました'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        // エラーメッセージを表示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('メモの更新に失敗しました: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  /// 削除確認ダイアログを表示
  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('メモを削除'),
        content: const Text('このメモを削除しますか？\nこの操作は取り消せません。'),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('削除'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        await ref.read(memoNotifierProvider.notifier).deleteMemo(memoId);
        
        if (context.mounted) {
          // メモ一覧の状態を自動更新
          ref.read(memoListNotifierProvider.notifier).getAllMemos();
          
          // 成功メッセージを表示
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('メモを削除しました'),
              backgroundColor: Colors.green,
            ),
          );
          
          // 前の画面に戻る
          context.pop();
        }
      } catch (error) {
        if (context.mounted) {
          // エラーメッセージを表示
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('メモの削除に失敗しました: $error'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  /// 日時をフォーマット
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}