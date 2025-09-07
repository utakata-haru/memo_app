import 'package:freezed_annotation/freezed_annotation.dart';
import '../../1_domain/1_entities/memo_entity.dart';

part 'memo_list_state.freezed.dart';

/// メモリストの状態を表現するクラス
/// 複数のメモを管理する際の状態（初期、ローディング、成功、エラー）を型安全に管理します
@freezed
class MemoListState with _$MemoListState {
  /// 初期状態
  const factory MemoListState.initial() = MemoListStateInitial;
  
  /// ローディング状態
  const factory MemoListState.loading() = MemoListStateLoading;
  
  /// データ読み込み完了状態
  const factory MemoListState.loaded(List<MemoEntity> memos) = MemoListStateLoaded;
  
  /// エラー状態
  const factory MemoListState.error(String message) = MemoListStateError;
}

/// MemoListStateの拡張メソッド
/// 状態の判定やデータ取得のためのユーティリティ機能を提供します
extension MemoListStateX on MemoListState {
  /// 現在ローディング中かどうか
  bool get isLoading => this is MemoListStateLoading;
  
  /// エラー状態かどうか
  bool get hasError => this is MemoListStateError;
  
  /// データが読み込まれているかどうか
  bool get hasData => this is MemoListStateLoaded;
  
  /// メモリストを取得（ある場合）
  List<MemoEntity>? get memos => mapOrNull(
    loaded: (state) => state.memos,
  );
  
  /// エラーメッセージを取得（ある場合）
  String? get errorMessage => mapOrNull(
    error: (state) => state.message,
  );
  
  /// メモの件数を取得
  int get memoCount => memos?.length ?? 0;
  
  /// 空のリストかどうか
  bool get isEmpty => memoCount == 0;
  
  /// メモが存在するかどうか
  bool get isNotEmpty => memoCount > 0;
}