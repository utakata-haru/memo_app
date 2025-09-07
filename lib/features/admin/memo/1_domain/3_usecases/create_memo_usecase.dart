import '../1_entities/memo_entity.dart';
import '../2_repositories/memo_repository.dart';
import '../../../../../core/exceptions/app_exception.dart';

/// メモ作成のパラメータ
class CreateMemoParams {
  final String title;
  final String content;

  const CreateMemoParams({
    required this.title,
    required this.content,
  });
}

/// メモを作成するユースケース
class CreateMemoUseCase {
  final MemoRepository _memoRepository;

  CreateMemoUseCase(this._memoRepository);

  /// メモを作成する
  /// 
  /// [params] メモ作成パラメータ
  /// 
  /// Returns: 作成されたメモエンティティ
  /// 
  /// Throws:
  /// - [DomainException] バリデーションエラーやビジネスルール違反の場合
  /// - [InfrastructureException] データアクセスエラーの場合
  Future<MemoEntity> call(CreateMemoParams params) async {
    try {
      // 入力検証
      _validateParams(params);

      // メモエンティティの作成
      final newMemo = MemoEntity.create(
        title: params.title.trim(),
        content: params.content.trim(),
      );

      // エンティティレベルのバリデーション
      if (!newMemo.isValid) {
        final errors = newMemo.validate();
        throw DomainException(
          message: 'メモの作成に失敗しました: ${errors.join(', ')}',
          code: 'MEMO_VALIDATION_FAILED',
          details: {'errors': errors},
        );
      }

      // メモの永続化
      final savedMemo = await _memoRepository.createMemo(newMemo);

      return savedMemo;
    } catch (e) {
      if (e is DomainException) {
        rethrow;
      }
      throw DomainException(
        message: 'メモの作成に失敗しました',
        code: 'CREATE_MEMO_FAILED',
        details: {'error': e.toString()},
      );
    }
  }

  /// パラメータのバリデーション
  void _validateParams(CreateMemoParams params) {
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