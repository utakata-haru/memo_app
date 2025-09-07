import '../../../../../core/exceptions/app_exception.dart';

/// メモが見つからない場合の例外
class MemoNotFoundException extends DomainException {
  MemoNotFoundException({
    required String memoId,
  }) : super(
          message: '指定されたメモが見つかりません',
          code: 'MEMO_NOT_FOUND',
          details: {'memoId': memoId},
        );
}

/// メモのバリデーションエラー例外
class MemoValidationException extends DomainException {
  MemoValidationException({
    required List<String> errors,
  }) : super(
          message: 'メモのバリデーションに失敗しました',
          code: 'MEMO_VALIDATION_FAILED',
          details: {'errors': errors},
        );
}

/// メモのタイトルが無効な場合の例外
class InvalidMemoTitleException extends DomainException {
  InvalidMemoTitleException({
    required String title,
    String? reason,
  }) : super(
          message: reason ?? 'メモのタイトルが無効です',
          code: 'INVALID_MEMO_TITLE',
          details: {'title': title, 'reason': reason},
        );
}

/// メモの内容が無効な場合の例外
class InvalidMemoContentException extends DomainException {
  InvalidMemoContentException({
    required String content,
    String? reason,
  }) : super(
          message: reason ?? 'メモの内容が無効です',
          code: 'INVALID_MEMO_CONTENT',
          details: {'content': content, 'reason': reason},
        );
}

/// メモが既に存在する場合の例外
class MemoAlreadyExistsException extends DomainException {
  MemoAlreadyExistsException({
    required String memoId,
  }) : super(
          message: '指定されたメモは既に存在します',
          code: 'MEMO_ALREADY_EXISTS',
          details: {'memoId': memoId},
        );
}