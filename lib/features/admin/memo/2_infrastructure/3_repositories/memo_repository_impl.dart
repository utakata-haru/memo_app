import '../../1_domain/1_entities/memo_entity.dart';
import '../../1_domain/2_repositories/memo_repository.dart';
import '../../1_domain/exceptions/memo_exceptions.dart';
import '../2_data_sources/1_local/memo_local_data_source.dart';
import '../2_data_sources/1_local/exceptions/local_data_source_exceptions.dart';
import '../1_models/memo_model.dart';
import '../../../../../core/exceptions/app_exception.dart';

/// メモリポジトリの実装クラス
/// ローカルデータソースのみを使用してメモの永続化を行います
class MemoRepositoryImpl implements MemoRepository {
  final MemoLocalDataSource _localDataSource;

  MemoRepositoryImpl(this._localDataSource);

  @override
  Future<List<MemoEntity>> getAllMemos() async {
    try {
      final memoModels = await _localDataSource.getAllMemos();
      return memoModels.map((model) => model.toEntity()).toList();
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Future<MemoEntity?> getMemoById(String id) async {
    try {
      final memoModel = await _localDataSource.getMemo(id);
      return memoModel?.toEntity();
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Future<MemoEntity> createMemo(MemoEntity memo) async {
    try {
      final memoModel = MemoModel.fromEntity(memo);
      await _localDataSource.saveMemo(memoModel);
      return memo;
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Future<MemoEntity> updateMemo(MemoEntity memo) async {
    try {
      // メモの存在確認
      final exists = await _localDataSource.memoExists(memo.id);
      if (!exists) {
        throw MemoNotFoundInLocalException('メモが見つかりません: ${memo.id}');
      }

      final memoModel = MemoModel.fromEntity(memo);
      await _localDataSource.updateMemo(memoModel);
      return memo;
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Future<void> deleteMemo(String id) async {
    try {
      // メモの存在確認
      final exists = await _localDataSource.memoExists(id);
      if (!exists) {
        throw MemoNotFoundInLocalException('削除対象のメモが見つかりません: $id');
      }

      await _localDataSource.deleteMemo(id);
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Future<bool> memoExists(String id) async {
    try {
      return await _localDataSource.memoExists(id);
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Future<List<MemoEntity>> searchMemosByTitle(String query) async {
    try {
      final memoModels = await _localDataSource.searchMemosByTitle(query);
      return memoModels.map((model) => model.toEntity()).toList();
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Future<List<MemoEntity>> searchMemosByContent(String query) async {
    try {
      final memoModels = await _localDataSource.searchMemosByContent(query);
      return memoModels.map((model) => model.toEntity()).toList();
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Stream<List<MemoEntity>> watchAllMemos() {
    try {
      return _localDataSource.watchAllMemos()
          .map((memoModels) => memoModels.map((model) => model.toEntity()).toList());
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  @override
  Stream<MemoEntity?> watchMemoById(String id) {
    try {
      return _localDataSource.watchMemo(id)
          .map((memoModel) => memoModel?.toEntity());
    } on LocalDataSourceException catch (e) {
      throw _convertToDomainException(e);
    }
  }

  /// ローカルデータソース例外をドメイン例外に変換
  DomainException _convertToDomainException(LocalDataSourceException e) {
    if (e is MemoNotFoundInLocalException) {
      return MemoNotFoundException(memoId: 'unknown');
    } else if (e is LocalStorageAccessException) {
      return MemoValidationException(errors: [e.message]);
    } else if (e is DataSerializationException) {
      return MemoValidationException(errors: [e.message]);
    } else {
      return MemoValidationException(errors: [e.toString()]);
    }
  }
}