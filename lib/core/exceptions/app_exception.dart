/// アプリケーション全体で使用される基底例外クラス
abstract class AppException implements Exception {
  /// エラーメッセージ
  final String message;
  
  /// エラーコード（オプション）
  final String? code;
  
  /// 詳細情報（オプション）
  final Map<String, dynamic>? details;

  const AppException({
    required this.message,
    this.code,
    this.details,
  });

  @override
  String toString() {
    final buffer = StringBuffer('$runtimeType: $message');
    if (code != null) {
      buffer.write(' (code: $code)');
    }
    if (details != null && details!.isNotEmpty) {
      buffer.write(' details: $details');
    }
    return buffer.toString();
  }
}

/// ドメイン層で発生する例外
class DomainException extends AppException {
  const DomainException({
    required super.message,
    super.code,
    super.details,
  });
}

/// インフラストラクチャ層で発生する例外
class InfrastructureException extends AppException {
  const InfrastructureException({
    required super.message,
    super.code,
    super.details,
  });
}

/// アプリケーション層で発生する例外
class ApplicationException extends AppException {
  const ApplicationException({
    required super.message,
    super.code,
    super.details,
  });
}

/// プレゼンテーション層で発生する例外
class PresentationException extends AppException {
  const PresentationException({
    required super.message,
    super.code,
    super.details,
  });
}