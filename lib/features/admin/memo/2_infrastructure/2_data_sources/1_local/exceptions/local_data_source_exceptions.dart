import '../../../../../../../core/exceptions/app_exception.dart';

/// ローカルデータソースの例外
class LocalDataSourceException extends InfrastructureException {
  LocalDataSourceException(
    String message, {
    String? code,
    super.details,
  }) : super(
          message: message,
          code: code ?? 'LOCAL_DATA_SOURCE_ERROR',
        );
}

/// メモが見つからない例外
class MemoNotFoundInLocalException extends LocalDataSourceException {
  MemoNotFoundInLocalException(String memoId)
      : super(
          'ローカルストレージでメモが見つかりません',
          code: 'MEMO_NOT_FOUND_LOCAL',
          details: {'memoId': memoId},
        );
}

/// ローカルストレージアクセス例外
class LocalStorageAccessException extends LocalDataSourceException {
  LocalStorageAccessException(String operation, String error)
      : super(
          'ローカルストレージへのアクセスに失敗しました: $operation',
          code: 'LOCAL_STORAGE_ACCESS_ERROR',
          details: {'operation': operation, 'error': error},
        );
}

/// データシリアライゼーション例外
class DataSerializationException extends LocalDataSourceException {
  DataSerializationException(String error)
      : super(
          'データのシリアライゼーションに失敗しました',
          code: 'DATA_SERIALIZATION_ERROR',
          details: {'error': error},
        );
}