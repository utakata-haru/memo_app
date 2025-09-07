// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'68c9ad772c198d1a34d2dcccc0a6a35f43092fd5';

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
    r'59d94f6077ed499880dc53a4393f37b2becdf89c';

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
String _$memoRepositoryHash() => r'fb8aadd1c368c5b5a2f8a14f576c5c95ce7bed14';

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
    r'3837221f35fb4992aaf5ce7dcf75ceec02fd3254';

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
String _$createMemoUseCaseHash() => r'bb77d3b23111889368e80ccd915011031728c38d';

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
String _$updateMemoUseCaseHash() => r'c229aea0ea71f79e32eea0b7302497c04e9a04b6';

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
String _$deleteMemoUseCaseHash() => r'9cd04a335379363c5a8722f70d39acd2e1184cbf';

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
