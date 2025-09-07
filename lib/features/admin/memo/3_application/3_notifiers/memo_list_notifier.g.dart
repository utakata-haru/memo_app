// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memoListNotifierHash() => r'7976d0c585fd8ed4190967cc5a65d083d030916e';

/// メモリストの状態管理を行うNotifier
///
/// メモの一覧取得、検索、リアルタイム監視などの操作を管理し、
/// 対応する状態変更をUIに提供します。
///
/// Copied from [MemoListNotifier].
@ProviderFor(MemoListNotifier)
final memoListNotifierProvider =
    AutoDisposeNotifierProvider<MemoListNotifier, MemoListState>.internal(
      MemoListNotifier.new,
      name: r'memoListNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$memoListNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MemoListNotifier = AutoDisposeNotifier<MemoListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
