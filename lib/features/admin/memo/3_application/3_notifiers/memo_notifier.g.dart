// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memoNotifierHash() => r'6b943a0dfb57bec923937fc596e350a5e07f03e3';

/// 単一メモの状態管理を行うNotifier
///
/// メモの取得、作成、更新、削除などの操作を管理し、
/// 対応する状態変更をUIに提供します。
///
/// Copied from [MemoNotifier].
@ProviderFor(MemoNotifier)
final memoNotifierProvider =
    AutoDisposeNotifierProvider<MemoNotifier, MemoState>.internal(
      MemoNotifier.new,
      name: r'memoNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$memoNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MemoNotifier = AutoDisposeNotifier<MemoState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
