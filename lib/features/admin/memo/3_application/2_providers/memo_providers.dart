import 'package:riverpod_annotation/riverpod_annotation.dart';

// ドメイン層
import '../../1_domain/2_repositories/memo_repository.dart';
import '../../1_domain/3_usecases/get_all_memos_usecase.dart';
import '../../1_domain/3_usecases/create_memo_usecase.dart';
import '../../1_domain/3_usecases/update_memo_usecase.dart';
import '../../1_domain/3_usecases/delete_memo_usecase.dart';

// インフラ層
import '../../2_infrastructure/3_repositories/memo_repository_impl.dart';
import '../../2_infrastructure/2_data_sources/1_local/memo_local_data_source.dart';
import '../../2_infrastructure/2_data_sources/1_local/memo_local_data_source_impl.dart';

// 共通
import '../../../../../core/database/app_database.dart';

part 'memo_providers.g.dart';

/// AppDatabaseの依存性注入
@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

/// MemoLocalDataSourceの依存性注入
@riverpod
MemoLocalDataSource memoLocalDataSource(MemoLocalDataSourceRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return MemoLocalDataSourceImpl(database);
}

/// MemoRepositoryの依存性注入
/// 
/// MemoLocalDataSourceを使用してMemoRepositoryImplのインスタンスを生成します。
/// 現在はローカルデータソースのみを使用しています。
@riverpod
MemoRepository memoRepository(MemoRepositoryRef ref) {
  final localDataSource = ref.watch(memoLocalDataSourceProvider);
  
  return MemoRepositoryImpl(localDataSource);
}

/// GetAllMemosUseCaseの依存性注入
@riverpod
GetAllMemosUseCase getAllMemosUseCase(GetAllMemosUseCaseRef ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return GetAllMemosUseCase(repository);
}

/// CreateMemoUseCaseの依存性注入
@riverpod
CreateMemoUseCase createMemoUseCase(CreateMemoUseCaseRef ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return CreateMemoUseCase(repository);
}

/// UpdateMemoUseCaseの依存性注入
@riverpod
UpdateMemoUseCase updateMemoUseCase(UpdateMemoUseCaseRef ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return UpdateMemoUseCase(repository);
}

/// DeleteMemoUseCaseの依存性注入
@riverpod
DeleteMemoUseCase deleteMemoUseCase(DeleteMemoUseCaseRef ref) {
  final repository = ref.watch(memoRepositoryProvider);
  return DeleteMemoUseCase(repository);
}