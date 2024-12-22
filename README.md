# テーブル設計

## Users テーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| id                 | bigint   | null: false, primary key  |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| password_digest    | string   | null: false               |
| created_at         | datetime | null: false               |
| updated_at         | datetime | null: false               |
### Association
 - has_many :journals, dependent: :destroy
 - has_many :tasks, dependent: :destroy

## Journals テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| user_id            | bigint   | null: false, foreign_key: true |
| entry_date         | date     | null: false                    |
| content            | text     | null: false                    |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :user
 - has_one :mood_option, as: :optionable, dependent: :destroy

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
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :user
 - has_one :mood_option, as: :optionable, dependent: :destroy

## Mood_Optionsテーブル （ポリモーフィック関連）
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| optionable_type    | string   | null: false                    |
| optionable_id      | bigint   | null: false                    |
| colors             | json     | null: false                    |
| labels             | json     | null: false                    |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :optionable, polymorphic: true