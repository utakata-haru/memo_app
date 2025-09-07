import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// メモ検索バーウィジェット
/// 検索テキストの入力とクリア機能を提供
class MemoSearchBar extends HookConsumerWidget {
  /// 検索テキストが変更された時のコールバック
  final ValueChanged<String> onSearchChanged;
  
  /// 検索をクリアした時のコールバック
  final VoidCallback onSearchCleared;
  
  /// 初期検索テキスト
  final String initialSearchText;

  const MemoSearchBar({
    super.key,
    required this.onSearchChanged,
    required this.onSearchCleared,
    this.initialSearchText = '',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 検索テキストコントローラー
    final searchController = useTextEditingController(
      text: initialSearchText,
    );
    
    // フォーカスノード
    final focusNode = useFocusNode();
    
    // 検索テキストの状態
    final searchText = useState(initialSearchText);
    
    // テキスト変更リスナー
    useEffect(() {
      void listener() {
        final text = searchController.text;
        searchText.value = text;
        onSearchChanged(text);
      }
      
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: searchController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: 'メモを検索...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchText.value.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    searchText.value = '';
                    onSearchCleared();
                    focusNode.unfocus();
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          focusNode.unfocus();
        },
      ),
    );
  }
}