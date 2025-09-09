import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

/// メモアプリケーションのメインウィジェット
/// Riverpodを使用した状態管理とGo Routerを使用したルーティングを設定します
class MemoApp extends ConsumerWidget {
  const MemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'メモアプリ',
      
      // テーマ設定
      theme: AppTheme.lightTheme,
      
      // ダークテーマ設定
      darkTheme: AppTheme.darkTheme,
      
      // システムのテーマモードに従う
      themeMode: ThemeMode.system,
      
      // ルーティング設定
      routerConfig: router,
      
      // デバッグバナーを非表示
      debugShowCheckedModeBanner: false,
    );
  }
}