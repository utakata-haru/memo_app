import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/admin/memo/4_presentation/2_pages/memo_list_page.dart';
import '../../features/admin/memo/4_presentation/2_pages/memo_create_page.dart';
import '../../features/admin/memo/4_presentation/2_pages/memo_detail_page.dart';

/// アプリケーションのルーティング設定
/// Go Routerを使用してページ間のナビゲーションを管理します
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/memos',
    routes: [
      // メモ一覧ページ
      GoRoute(
        path: '/memos',
        name: 'memo-list',
        builder: (context, state) => const MemoListPage(),
      ),
      
      // メモ作成ページ
      GoRoute(
        path: '/memos/create',
        name: 'memo-create',
        builder: (context, state) => const MemoCreatePage(),
      ),
      
      // メモ詳細ページ
      GoRoute(
        path: '/memos/:id',
        name: 'memo-detail',
        builder: (context, state) {
          final memoId = state.pathParameters['id']!;
          return MemoDetailPage(memoId: memoId);
        },
      ),
    ],
    
    // エラーページ
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('エラー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'ページが見つかりません',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.error?.toString() ?? '不明なエラーが発生しました',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/memos'),
              child: const Text('メモ一覧に戻る'),
            ),
          ],
        ),
      ),
    ),
  );
});

/// ルーティング関連のユーティリティクラス
class AppRoutes {
  /// メモ一覧ページのパス
  static const String memoList = '/memos';
  
  /// メモ作成ページのパス
  static const String memoCreate = '/memos/create';
  
  /// メモ詳細ページのパス（IDを含む）
  static String memoDetail(String id) => '/memos/$id';
  
  /// メモ一覧ページに移動
  static void goToMemoList(BuildContext context) {
    context.go(memoList);
  }
  
  /// メモ作成ページに移動
  static void goToMemoCreate(BuildContext context) {
    context.go(memoCreate);
  }
  
  /// メモ詳細ページに移動
  static void goToMemoDetail(BuildContext context, String id) {
    context.go(memoDetail(id));
  }
  
  /// メモ一覧ページにプッシュ
  static void pushMemoList(BuildContext context) {
    context.push(memoList);
  }
  
  /// メモ作成ページにプッシュ
  static void pushMemoCreate(BuildContext context) {
    context.push(memoCreate);
  }
  
  /// メモ詳細ページにプッシュ
  static void pushMemoDetail(BuildContext context, String id) {
    context.push(memoDetail(id));
  }
}