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
 - has_many :journals
 - has_many :tasks

## Journals テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| user_id            | bigint   | null: false, foreign_key: true |
| entry_date         | date     | null: false                    |
| mood               | string   | null: false                    |
| content            | text     | null: false                    |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :user
 - has_one :mood_option
 - has_many :journals_tasks
 - has_many :tasks, through: :journals_tasks

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
 - has_many :journals_tasks
 - has_many :journals, through: :journals_tasks
 - has_many :task_tags
 - has_many :tags, through: :task_tags

## Journals_Tasks テーブル （中間テーブル）
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| journal_id         | bigint   | null: false, foreign_key: true |
| task_id            | bigint   | null: false, foreign_key: true |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :journal
 - belongs_to :task

## Mood_Optionsテーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| journal_id         | bigint   | null: false, foreign_key: true |
| colors             | json     | null: false                    |
| labels             | json     | null: false                    |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :journal

## Tags テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| name               | string   | null: false, unique: true      |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :user
 - has_many :task_tags
 - has_many :tasks, through: :task_tags

## Task_Tags テーブル （中間テーブル）
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| id                 | bigint   | null: false, primary key       |
| task_id            | bigint   | null: false, foreign_key: true |
| tag_id             | bigint   | null: false, foreign_key: true |
| created_at         | datetime | null: false                    |
| updated_at         | datetime | null: false                    |
### Association
 - belongs_to :task
 - belongs_to :tag