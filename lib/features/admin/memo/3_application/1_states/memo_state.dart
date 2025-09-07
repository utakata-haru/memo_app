import 'package:freezed_annotation/freezed_annotation.dart';
import '../../1_domain/1_entities/memo_entity.dart';

part 'memo_state.freezed.dart';

/// メモの状態を表現するクラス
/// 非同期処理の状態（初期、ローディング、成功、エラー）を型安全に管理します
@freezed
class MemoState with _$MemoState {
  /// 初期状態
  const factory MemoState.initial() = MemoStateInitial;
  
  /// ローディング状態
  const factory MemoState.loading() = MemoStateLoading;
  
  /// データ読み込み完了状態
  const factory MemoState.loaded(MemoEntity memo) = MemoStateLoaded;
  
  /// エラー状態
  const factory MemoState.error(String message) = MemoStateError;
}

/// MemoStateの拡張メソッド
/// 状態の判定やデータ取得のためのユーティリティ機能を提供します
extension MemoStateX on MemoState {
  /// 現在ローディング中かどうか
  bool get isLoading => this is MemoStateLoading;
  
  /// エラー状態かどうか
  bool get hasError => this is MemoStateError;
  
  /// データが読み込まれているかどうか
  bool get hasData => this is MemoStateLoaded;
  
  /// メモデータを取得（ある場合）
  MemoEntity? get memo => mapOrNull(
    loaded: (state) => state.memo,
  );
  
  /// エラーメッセージを取得（ある場合）
  String? get errorMessage => mapOrNull(
    error: (state) => state.message,
  );
}