// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'18ce5c8c4d8ddbfe5a7d819d8fb7d5aca76bf416';

/// AppDatabaseの依存性注入
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = AutoDisposeProviderRef<AppDatabase>;
String _$memoLocalDataSourceHash() =>
    r'61e9e4078185afa1b2c7f5de96d19f6519b93e24';

/// MemoLocalDataSourceの依存性注入
///
/// Copied from [memoLocalDataSource].
@ProviderFor(memoLocalDataSource)
final memoLocalDataSourceProvider =
    AutoDisposeProvider<MemoLocalDataSource>.internal(
      memoLocalDataSource,
      name: r'memoLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$memoLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MemoLocalDataSourceRef = AutoDisposeProviderRef<MemoLocalDataSource>;
String _$memoRepositoryHash() => r'fe2dcfea39ee821f91c41801ef0195840256afde';

/// MemoRepositoryの依存性注入
///
/// MemoLocalDataSourceを使用してMemoRepositoryImplのインスタンスを生成します。
/// 現在はローカルデータソースのみを使用しています。
///
/// Copied from [memoRepository].
@ProviderFor(memoRepository)
final memoRepositoryProvider = AutoDisposeProvider<MemoRepository>.internal(
  memoRepository,
  name: r'memoRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$memoRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MemoRepositoryRef = AutoDisposeProviderRef<MemoRepository>;
String _$getAllMemosUseCaseHash() =>
    r'c540a109195145f7bb2910d3c723866740adf731';

/// GetAllMemosUseCaseの依存性注入
///
/// Copied from [getAllMemosUseCase].
@ProviderFor(getAllMemosUseCase)
final getAllMemosUseCaseProvider =
    AutoDisposeProvider<GetAllMemosUseCase>.internal(
      getAllMemosUseCase,
      name: r'getAllMemosUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getAllMemosUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllMemosUseCaseRef = AutoDisposeProviderRef<GetAllMemosUseCase>;
String _$createMemoUseCaseHash() => r'82a997452562e7787285ac74f8e27b40715e5b22';

/// CreateMemoUseCaseの依存性注入
///
/// Copied from [createMemoUseCase].
@ProviderFor(createMemoUseCase)
final createMemoUseCaseProvider =
    AutoDisposeProvider<CreateMemoUseCase>.internal(
      createMemoUseCase,
      name: r'createMemoUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$createMemoUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CreateMemoUseCaseRef = AutoDisposeProviderRef<CreateMemoUseCase>;
String _$updateMemoUseCaseHash() => r'd64026826e5f6582398084ea28f9eb9765ac6eef';

/// UpdateMemoUseCaseの依存性注入
///
/// Copied from [updateMemoUseCase].
@ProviderFor(updateMemoUseCase)
final updateMemoUseCaseProvider =
    AutoDisposeProvider<UpdateMemoUseCase>.internal(
      updateMemoUseCase,
      name: r'updateMemoUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateMemoUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateMemoUseCaseRef = AutoDisposeProviderRef<UpdateMemoUseCase>;
String _$deleteMemoUseCaseHash() => r'100b78c6188cd1ac664b7f15cdc47bf412d65463';

/// DeleteMemoUseCaseの依存性注入
///
/// Copied from [deleteMemoUseCase].
@ProviderFor(deleteMemoUseCase)
final deleteMemoUseCaseProvider =
    AutoDisposeProvider<DeleteMemoUseCase>.internal(
      deleteMemoUseCase,
      name: r'deleteMemoUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$deleteMemoUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeleteMemoUseCaseRef = AutoDisposeProviderRef<DeleteMemoUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
