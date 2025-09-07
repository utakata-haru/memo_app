import '../1_entities/memo_entity.dart';
import '../2_repositories/memo_repository.dart';
import '../../../../../core/exceptions/app_exception.dart';

/// メモ更新のパラメータ
class UpdateMemoParams {
  final String id;
  final String title;
  final String content;

  const UpdateMemoParams({
    required this.id,
    required this.title,
    required this.content,
  });
}

/// メモを更新するユースケース
class UpdateMemoUseCase {
  final MemoRepository _memoRepository;

  UpdateMemoUseCase(this._memoRepository);

  /// メモを更新する
  /// 
  /// [params] メモ更新パラメータ
  /// 
  /// Returns: 更新されたメモエンティティ
  /// 
  /// Throws:
  /// - [DomainException] バリデーションエラーやビジネスルール違反の場合
  /// - [InfrastructureException] データアクセスエラーの場合
  Future<MemoEntity> call(UpdateMemoParams params) async {
    try {
      // 入力検証
      _validateParams(params);

      // 既存メモの取得
      final existingMemo = await _memoRepository.getMemoById(params.id);
      if (existingMemo == null) {
        throw DomainException(
          message: '指定されたメモが見つかりません',
          code: 'MEMO_NOT_FOUND',
          details: {'id': params.id},
        );
      }

      // メモの更新
      final updatedMemo = existingMemo.updateContent(
        title: params.title.trim(),
        content: params.content.trim(),
      );

      // エンティティレベルのバリデーション
      if (!updatedMemo.isValid) {
        final errors = updatedMemo.validate();
        throw DomainException(
          message: 'メモの更新に失敗しました: ${errors.join(', ')}',
          code: 'MEMO_VALIDATION_FAILED',
          details: {'errors': errors},
        );
      }

      // メモの永続化
      final savedMemo = await _memoRepository.updateMemo(updatedMemo);

      return savedMemo;
    } catch (e) {
      if (e is DomainException) {
        rethrow;
      }
      throw DomainException(
        message: 'メモの更新に失敗しました',
        code: 'UPDATE_MEMO_FAILED',
        details: {'error': e.toString()},
      );
    }
  }

  /// パラメータのバリデーション
  void _validateParams(UpdateMemoParams params) {
    if (params.id.trim().isEmpty) {
      throw DomainException(
        message: 'メモIDは必須です',
        code: 'MEMO_ID_REQUIRED',
      );
    }

    if (params.title.trim().isEmpty) {
      throw DomainException(
        message: 'タイトルは必須です',
        code: 'TITLE_REQUIRED',
      );
    }

    if (params.title.trim().length > 100) {
      throw DomainException(
        message: 'タイトルは100文字以内で入力してください',
        code: 'TITLE_TOO_LONG',
      );
    }

    if (params.content.trim().length > 10000) {
      throw DomainException(
        message: '内容は10000文字以内で入力してください',
        code: 'CONTENT_TOO_LONG',
      );
    }
  }
}