# テーブル設計

## Users テーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| id                 | bigint   | null: false, primary key  |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| password_digest    | string   | null: false               |
| created_at         | datetime | null: false               |
| update_at          | datetime | null: false               |

## Journals テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| user_id            | bigint   | null: false, foreign_key: true |
| entry_date         | date     | null: false                    |
| mood               | integer  |                                |
| content            | text     | null: false                    |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |

## Tasks テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| user_id            | bigint   | null: false, foreign_key: true |
| title              | string   | null: false                    |
| description        | text     |                                |
| due_date           | datetime |                                |
| status             | integer  | default: 0                     |
| priority           | integer  | default: 0                     |
| journal_id         | bigint   | foreign_key: true              |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |

## Mood_Optionsテーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| user_id            | bigint   | null: false, foreign_key: true |
| label              | string   | null: false                    |
| color              | string   | null: false                    |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |

## Tags テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| name               | string   | null: false, unique: true      |
| user_id            | bigint   | null: false, foreign_key: true |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |

## Task_Tags テーブル （中間テーブル）
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| task_id            | bigint   | null: false, foreign_key: true |
| tag_id             | bigint   | null: false, foreign_key: true |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |