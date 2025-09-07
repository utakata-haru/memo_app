import '../2_repositories/memo_repository.dart';
import '../../../../../core/exceptions/app_exception.dart';

/// メモを削除するユースケース
class DeleteMemoUseCase {
  final MemoRepository _memoRepository;

  DeleteMemoUseCase(this._memoRepository);

  /// メモを削除する
  /// 
  /// [id] 削除するメモのID
  /// 
  /// Throws:
  /// - [DomainException] バリデーションエラーやビジネスルール違反の場合
  /// - [InfrastructureException] データアクセスエラーの場合
  Future<void> call(String id) async {
    try {
      // 入力検証
      _validateId(id);

      // メモの存在確認
      final exists = await _memoRepository.memoExists(id);
      if (!exists) {
        throw DomainException(
          message: '指定されたメモが見つかりません',
          code: 'MEMO_NOT_FOUND',
          details: {'id': id},
        );
      }

      // メモの削除
      await _memoRepository.deleteMemo(id);
    } catch (e) {
      if (e is DomainException) {
        rethrow;
      }
      throw DomainException(
        message: 'メモの削除に失敗しました',
        code: 'DELETE_MEMO_FAILED',
        details: {'error': e.toString()},
      );
    }
  }

  /// IDのバリデーション
  void _validateId(String id) {
    if (id.trim().isEmpty) {
      throw DomainException(
        message: 'メモIDは必須です',
        code: 'MEMO_ID_REQUIRED',
      );
    }
  }
}