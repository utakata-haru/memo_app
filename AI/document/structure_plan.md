# 🏗️ メモアプリケーション構造計画書

## 📋 概要

本ドキュメントは、メモアプリケーションの実装に必要なファイル構成とアーキテクチャ設計を定義します。
クリーンアーキテクチャの4層構造に基づき、`lib/features/user/memo/` 配下にメモ機能を実装します。

## 🎯 フィーチャー定義

- **権限レベル**: `user`（一般ユーザー機能）
- **フィーチャー名**: `memo`
- **配置パス**: `lib/features/user/memo/`

## 📁 ディレクトリ構造

```
lib/features/user/memo/
├── 1_domain/
│   ├── 1_entities/
│   ├── 2_repositories/
│   ├── 3_usecases/
│   └── exceptions/
├── 2_infrastructure/
│   ├── 1_models/
│   ├── 2_data_sources/
│   │   └── 1_local/
│   │       └── exceptions/
│   └── 3_repositories/
├── 3_application/
│   ├── 1_states/
│   ├── 2_providers/
│   └── 3_notifiers/
└── 4_presentation/
    ├── 1_widgets/
    │   ├── 1_atoms/
    │   ├── 2_molecules/
    │   └── 3_organisms/
    └── 2_pages/
```

## 📄 ファイル構成計画

### 🎯 1. Domain層（ビジネスロジック）

#### 1_entities/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_entity.dart` | `lib/features/user/memo/1_domain/1_entities/` | メモのビジネスオブジェクト（ID、タイトル、本文、作成日時、更新日時） |

#### 2_repositories/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_repository.dart` | `lib/features/user/memo/1_domain/2_repositories/` | メモデータアクセスのインターフェース定義 |

#### 3_usecases/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `create_memo_usecase.dart` | `lib/features/user/memo/1_domain/3_usecases/` | メモ作成のビジネスロジック |
| `get_all_memos_usecase.dart` | `lib/features/user/memo/1_domain/3_usecases/` | 全メモ取得のビジネスロジック |
| `get_memo_usecase.dart` | `lib/features/user/memo/1_domain/3_usecases/` | 単一メモ取得のビジネスロジック |
| `update_memo_usecase.dart` | `lib/features/user/memo/1_domain/3_usecases/` | メモ更新のビジネスロジック |
| `delete_memo_usecase.dart` | `lib/features/user/memo/1_domain/3_usecases/` | メモ削除のビジネスロジック |

#### exceptions/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_domain_exception.dart` | `lib/features/user/memo/1_domain/exceptions/` | メモドメイン固有の例外クラス |

### 🏗️ 2. Infrastructure層（データアクセス）

#### 1_models/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_model.dart` | `lib/features/user/memo/2_infrastructure/1_models/` | メモのデータモデル（Drift用テーブル定義含む） |

#### 2_data_sources/1_local/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_local_data_source.dart` | `lib/features/user/memo/2_infrastructure/2_data_sources/1_local/` | ローカルDB（Drift）アクセスのインターフェース |
| `memo_local_data_source_impl.dart` | `lib/features/user/memo/2_infrastructure/2_data_sources/1_local/` | Driftを使用したローカルデータアクセス実装 |

#### 2_data_sources/1_local/exceptions/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_drift_exception.dart` | `lib/features/user/memo/2_infrastructure/2_data_sources/1_local/exceptions/` | Drift操作時の例外クラス |



#### 3_repositories/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_repository_impl.dart` | `lib/features/user/memo/2_infrastructure/3_repositories/` | メモリポジトリの具象実装 |

### 🔄 3. Application層（状態管理）

#### 1_states/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_state.dart` | `lib/features/user/memo/3_application/1_states/` | メモ関連の状態定義（Freezed使用） |
| `memo_list_state.dart` | `lib/features/user/memo/3_application/1_states/` | メモ一覧の状態定義 |

#### 2_providers/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_providers.dart` | `lib/features/user/memo/3_application/2_providers/` | メモ関連の依存性注入Provider定義 |

#### 3_notifiers/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_notifier.dart` | `lib/features/user/memo/3_application/3_notifiers/` | 単一メモの状態管理Notifier |
| `memo_list_notifier.dart` | `lib/features/user/memo/3_application/3_notifiers/` | メモ一覧の状態管理Notifier |

### 🎨 4. Presentation層（UI）

#### 1_widgets/1_atoms/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_title_text.dart` | `lib/features/user/memo/4_presentation/1_widgets/1_atoms/` | メモタイトル表示用テキストウィジェット |
| `memo_content_text.dart` | `lib/features/user/memo/4_presentation/1_widgets/1_atoms/` | メモ本文表示用テキストウィジェット |
| `memo_date_text.dart` | `lib/features/user/memo/4_presentation/1_widgets/1_atoms/` | 作成日時表示用テキストウィジェット |
| `memo_input_field.dart` | `lib/features/user/memo/4_presentation/1_widgets/1_atoms/` | メモ入力用テキストフィールド |

#### 1_widgets/2_molecules/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_list_item.dart` | `lib/features/user/memo/4_presentation/1_widgets/2_molecules/` | メモ一覧の単一アイテムウィジェット |
| `memo_form.dart` | `lib/features/user/memo/4_presentation/1_widgets/2_molecules/` | メモ作成・編集フォームウィジェット |
| `memo_detail_card.dart` | `lib/features/user/memo/4_presentation/1_widgets/2_molecules/` | メモ詳細表示カードウィジェット |

#### 1_widgets/3_organisms/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_list_view.dart` | `lib/features/user/memo/4_presentation/1_widgets/3_organisms/` | メモ一覧表示ウィジェット |
| `memo_form_section.dart` | `lib/features/user/memo/4_presentation/1_widgets/3_organisms/` | メモ作成・編集セクションウィジェット |

#### 2_pages/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `memo_list_page.dart` | `lib/features/user/memo/4_presentation/2_pages/` | メモ一覧画面（ホーム画面） |
| `memo_create_page.dart` | `lib/features/user/memo/4_presentation/2_pages/` | メモ作成画面 |
| `memo_edit_page.dart` | `lib/features/user/memo/4_presentation/2_pages/` | メモ編集画面 |
| `memo_detail_page.dart` | `lib/features/user/memo/4_presentation/2_pages/` | メモ詳細表示画面 |

## 🔧 共通ファイル

### lib/core/exceptions/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `base_exception.dart` | `lib/core/exceptions/` | 基底例外クラス |
| `storage_exception.dart` | `lib/core/exceptions/` | ストレージ関連例外 |

### lib/core/database/
| ファイル名 | 配置パス | 役割 |
|-----------|----------|------|
| `app_database.dart` | `lib/core/database/` | Driftデータベース定義 |

## 🎯 技術仕様

### 使用ライブラリ
- **状態管理**: Riverpod + Flutter Hooks
- **データモデル**: Freezed
- **ローカルDB**: Drift
- **画面遷移**: GoRouter

### アーキテクチャ原則
- クリーンアーキテクチャの4層構造を厳格遵守
- 依存性の方向は外側から内側へ（Presentation → Application → Domain ← Infrastructure）
- 各層の責務を明確に分離
- テスタビリティを重視した設計

## 📝 実装順序

1. **共通例外クラス**の実装
2. **Domain層**の実装（Entity → Repository Interface → UseCase）
3. **Infrastructure層**の実装（Model → DataSource → Repository Implementation）
4. **Application層**の実装（State → Provider → Notifier）
5. **Presentation層**の実装（Atoms → Molecules → Organisms → Pages）

## ✅ 完了条件

- 全ファイルが仕様書の要件を満たしている
- クリーンアーキテクチャの原則に従っている
- `flutter analyze` でエラー・警告がない
- 各層の責務が適切に分離されている

---

## 📝 更新履歴

### 2025年1月15日
- 初版作成
- メモアプリケーションの構造計画書策定完了