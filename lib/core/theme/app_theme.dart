import 'package:flutter/material.dart';

/// アプリケーションのテーマ設定を管理するクラス
/// ライトテーマとダークテーマの両方を提供します
class AppTheme {
  // プライベートコンストラクタで静的クラスとして使用
  AppTheme._();

  /// シードカラー
  static const Color _seedColor = Colors.blue;

  /// ライトテーマ
  static ThemeData get lightTheme {
    return ThemeData(
      // カラースキーム
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ),
      
      // AppBarのテーマ
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      
      // カードのテーマ
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      
      // ボタンのテーマ
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      
      // 入力フィールドのテーマ
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      
      // フォントファミリー
      fontFamily: 'NotoSansJP',
      
      // 使いやすさの向上
      useMaterial3: true,
    );
  }

  /// ダークテーマ
  static ThemeData get darkTheme {
    return ThemeData(
      // カラースキーム
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.dark,
      ),
      
      // AppBarのテーマ
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      
      // カードのテーマ
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      
      // ボタンのテーマ
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      
      // 入力フィールドのテーマ
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      
      // フォントファミリー
      fontFamily: 'NotoSansJP',
      
      // 使いやすさの向上
      useMaterial3: true,
    );
  }
}
