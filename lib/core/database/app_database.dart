import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

/// メモテーブルの定義
class Memos extends Table {
  /// メモID（主キー）
  TextColumn get id => text()();
  
  /// タイトル
  TextColumn get title => text().withLength(min: 1, max: 100)();
  
  /// 内容
  TextColumn get content => text().withLength(max: 10000)();
  
  /// 作成日時
  DateTimeColumn get createdAt => dateTime()();
  
  /// 更新日時
  DateTimeColumn get updatedAt => dateTime()();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// アプリケーションのデータベースクラス
@DriftDatabase(tables: [Memos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// メモの全件取得（作成日時降順）
  Future<List<Memo>> getAllMemos() {
    return (select(memos)
          ..orderBy([(memo) => OrderingTerm.desc(memo.createdAt)]))
        .get();
  }

  /// IDでメモを取得
  Future<Memo?> getMemoById(String id) {
    return (select(memos)..where((memo) => memo.id.equals(id)))
        .getSingleOrNull();
  }

  /// メモの作成
  Future<int> createMemo(MemosCompanion memo) {
    return into(memos).insert(memo);
  }

  /// メモの更新
  Future<bool> updateMemo(MemosCompanion memo) {
    return update(memos).replace(memo);
  }

  /// メモの削除
  Future<int> deleteMemoById(String id) {
    return (delete(memos)..where((memo) => memo.id.equals(id))).go();
  }

  /// 全メモの削除
  Future<int> deleteAllMemos() {
    return delete(memos).go();
  }

  /// メモの存在確認
  Future<bool> memoExists(String id) async {
    final memo = await getMemoById(id);
    return memo != null;
  }

  /// 全メモの監視（リアルタイム更新）
  Stream<List<Memo>> watchAllMemos() {
    return (select(memos)
          ..orderBy([(memo) => OrderingTerm.desc(memo.createdAt)]))
        .watch();
  }

  /// 指定メモの監視
  Stream<Memo?> watchMemo(String id) {
    return (select(memos)..where((memo) => memo.id.equals(id)))
        .watchSingleOrNull();
  }

  /// タイトルで検索
  Future<List<Memo>> searchMemosByTitle(String query) {
    return (select(memos)
          ..where((memo) => memo.title.like('%$query%'))
          ..orderBy([(memo) => OrderingTerm.desc(memo.createdAt)]))
        .get();
  }

  /// 内容で検索
  Future<List<Memo>> searchMemosByContent(String query) {
    return (select(memos)
          ..where((memo) => memo.content.like('%$query%'))
          ..orderBy([(memo) => OrderingTerm.desc(memo.createdAt)]))
        .get();
  }

  /// タイトルまたは内容で検索
  Future<List<Memo>> searchMemos(String query) {
    return (select(memos)
          ..where((memo) =>
              memo.title.like('%$query%') | memo.content.like('%$query%'))
          ..orderBy([(memo) => OrderingTerm.desc(memo.createdAt)]))
        .get();
  }
}

/// データベース接続の設定
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'memo_app.db'));
    return NativeDatabase.createInBackground(file);
  });
}