import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../3_application/3_notifiers/memo_notifier.dart';
import '../../3_application/3_notifiers/memo_list_notifier.dart';
import '../1_widgets/1_atoms/loading_indicator.dart';

/// メモ作成ページ
class MemoCreatePage extends HookConsumerWidget {
  const MemoCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // フォームコントローラー
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    
    // フォームキー
    final formKey = useMemoized(() => GlobalKey<FormState>());
    
    // ローディング状態
    final isLoading = useState(false);
    
    // フォーカスノード
    final titleFocusNode = useFocusNode();
    final contentFocusNode = useFocusNode();
    
    // 初期フォーカス設定
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        titleFocusNode.requestFocus();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('メモを作成'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        actions: [
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
                    ),
            child: const Text(
              '保存',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // タイトル入力フィールド
                  TextFormField(
                    controller: titleController,
                    focusNode: titleFocusNode,
                    decoration: const InputDecoration(
                      labelText: 'タイトル',
                      hintText: 'メモのタイトルを入力してください',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      contentFocusNode.requestFocus();
                    },
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
                      focusNode: contentFocusNode,
                      decoration: const InputDecoration(
                        labelText: '内容',
                        hintText: 'メモの内容を入力してください',
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
          ),
          
          // ローディングオーバーレイ
          if (isLoading.value)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const LoadingIndicator(
                message: 'メモを保存中...',
              ),
            ),
        ],
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
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      await ref.read(memoNotifierProvider.notifier).createMemo(
        title: titleController.text.trim(),
        content: contentController.text.trim(),
      );

      if (context.mounted) {
        // メモ一覧の状態を自動更新
        ref.read(memoListNotifierProvider.notifier).getAllMemos();
        
        // 成功メッセージを表示
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('メモを作成しました'),
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
            content: Text('メモの作成に失敗しました: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}