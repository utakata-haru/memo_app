import 'package:flutter/material.dart';

/// ローディングインジケーターウィジェット
/// アプリ全体で統一されたローディング表示を提供
class LoadingIndicator extends StatelessWidget {
  /// ローディングメッセージ
  final String? message;
  
  /// インジケーターのサイズ
  final double? size;
  
  /// インジケーターの色
  final Color? color;

  const LoadingIndicator({
    super.key,
    this.message,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size ?? 32.0,
            height: size ?? 32.0,
            child: CircularProgressIndicator(
              color: color ?? Theme.of(context).colorScheme.primary,
              strokeWidth: 3.0,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16.0),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}