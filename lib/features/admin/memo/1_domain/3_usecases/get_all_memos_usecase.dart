import '../1_entities/memo_entity.dart';
import '../2_repositories/memo_repository.dart';
import '../../../../../core/exceptions/app_exception.dart';

/// 全てのメモを取得するユースケース
class GetAllMemosUseCase {
  final MemoRepository _memoRepository;

  GetAllMemosUseCase(this._memoRepository);

  /// 全てのメモを取得する
  /// 
  /// Returns: メモエンティティのリスト
  /// 
  /// Throws:
  /// - [DomainException] ビジネスルール違反の場合
  /// - [InfrastructureException] データアクセスエラーの場合
  Future<List<MemoEntity>> call() async {
    try {
      final memos = await _memoRepository.getAllMemos();
      
      // 作成日時の降順でソート（新しいものが先頭）
      memos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      
      return memos;
    } catch (e) {
      throw DomainException(
        message: 'メモの取得に失敗しました',
        code: 'GET_ALL_MEMOS_FAILED',
        details: {'error': e.toString()},
      );
    }
  }
}