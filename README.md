# アプリケーション名
  ココロタスク

# アプリケーション概要
  自分と向き合うきっかけを作る為に、日々の気持ちと連携したタスク管理ができるアプリ

# URL
  https://kokoro-task.onrender.com

# テスト用アカウント
 - Basic認証ID : admin
 - Basic認証パスワード : 1111
 - メールアドレス : kokoro@sample.com
 - パスワード : kokoro1234

  - メールアドレス : test@sample.com
  - パスワード : test1234

# 利用方法
### 1, ログインページ
  メールアドレスとパスワードを入力して、自身のアカウントにログインする。
  初めて利用する場合は、新規登録ボタンからアカウント登録を行う。
  [![Image from Gyazo](https://i.gyazo.com/4bd6bf5f4a413ee58fbb460f4a5820a8.png)](https://gyazo.com/4bd6bf5f4a413ee58fbb460f4a5820a8)
### 2, ジャーナリング投稿
  [![Image from Gyazo](https://i.gyazo.com/be83acdb42681fe1a47a2b22cb13ea0d.png)](https://gyazo.com/be83acdb42681fe1a47a2b22cb13ea0d)

  [![Image from Gyazo](https://i.gyazo.com/935062be0f73472125a5dd03b9eac3a1.png)](https://gyazo.com/935062be0f73472125a5dd03b9eac3a1)

  [![Image from Gyazo](https://i.gyazo.com/533d7de702a4ab3908475ada910262b6.png)](https://gyazo.com/533d7de702a4ab3908475ada910262b6)

  [![Image from Gyazo](https://i.gyazo.com/22bd312b5a92abe28debacc6bd0cadb9.png)](https://gyazo.com/22bd312b5a92abe28debacc6bd0cadb9)

# アプリケーションを作成した背景
    社会人として働きながら資格の勉強をしていたとき、タスク管理アプリとジャーナリングアプリを併用していました。しかし、それぞれ別のアプリを使うのは手間がかかり、学習の進捗や日々の気持ちを一元管理できたらもっと便利なのにと思うことがありました。

    そこで、タスク管理とジャーナリングを組み合わせ、日々の感情の変化とタスクの達成を可視化できるアプリがあれば、より無理なく目標に向かえるのではないかと考え、「ココロタスク」を開発しました。

# データベース設計
  [![Image from Gyazo](https://i.gyazo.com/3584a91298cdf8e0170abaf84b9114ad.png)](https://gyazo.com/3584a91298cdf8e0170abaf84b9114ad)

# 画面遷移図
  [![Image from Gyazo](https://i.gyazo.com/54cd2eb35677ad7a0eb2f14ca2428b83.png)](https://gyazo.com/54cd2eb35677ad7a0eb2f14ca2428b83)

# 工夫したポイント
  Mood_Optionsテーブルをポリモーフィック関連にしたことについて書く

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