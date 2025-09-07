import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

/// アプリケーションのエントリーポイント
/// Riverpodを使用した状態管理を初期化してMemoAppを起動します
void main() {
  runApp(
    // Riverpodの状態管理を有効にするためのProviderScope
    const ProviderScope(
      child: MemoApp(),
    ),
  );
}
