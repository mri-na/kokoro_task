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

# 利用方法
## 1, ログインページ
    メールアドレスとパスワードを入力して、自身のアカウントにログインします。
    初めて利用する場合は、新規登録ボタンからアカウント登録を行います。
  [![Image from Gyazo](https://i.gyazo.com/4bd6bf5f4a413ee58fbb460f4a5820a8.png)](https://gyazo.com/4bd6bf5f4a413ee58fbb460f4a5820a8)
## 2, ダッシュボード（ホーム画面）
    ジャーナリングとタスクの投稿画面をクリックすると各詳細画面に遷移して、投稿内容を編集することができます。
  [![Image from Gyazo](https://i.gyazo.com/9a6afc49747a833937bbc2def7cea2a3.png)](https://gyazo.com/9a6afc49747a833937bbc2def7cea2a3)

    タスクが完了したら『完了にする』ボタンをクリックすると未完了から完了に表示が変更します。
  [![Image from Gyazo](https://i.gyazo.com/13c3e5b11a856258b93ac3cdfa5eb851.gif)](https://gyazo.com/13c3e5b11a856258b93ac3cdfa5eb851)
## 3, ジャーナリング投稿
    ダッシュボードの『ジャーナル新規投稿』のボタンをクリックすると投稿画面に遷移します。
  [![Image from Gyazo](https://i.gyazo.com/be83acdb42681fe1a47a2b22cb13ea0d.png)](https://gyazo.com/be83acdb42681fe1a47a2b22cb13ea0d)

    投稿時の感情を選択します。感情に合わせて色が設定されており、選択した色の中間色を今のココロの色として表示します。
  [![Image from Gyazo](https://i.gyazo.com/0d09baf7f5a424e8cc978d40c7de296b.gif)](https://gyazo.com/0d09baf7f5a424e8cc978d40c7de296b)

    何についてのジャーナル投稿なのかを選択します。
  [![Image from Gyazo](https://i.gyazo.com/533d7de702a4ab3908475ada910262b6.png)](https://gyazo.com/533d7de702a4ab3908475ada910262b6)

    投稿完了です！
  [![Image from Gyazo](https://i.gyazo.com/22bd312b5a92abe28debacc6bd0cadb9.png)](https://gyazo.com/22bd312b5a92abe28debacc6bd0cadb9)
## 4, タスク投稿
    ダッシュボードの『タスク新規投稿』のボタンをクリックすると投稿画面に遷移します。
  [![Image from Gyazo](https://i.gyazo.com/81cabe0cc453504598fc30b2af9f5be9.png)](https://gyazo.com/81cabe0cc453504598fc30b2af9f5be9)

    ジャーナリング投稿と同様に、投稿時の感情を選択します。感情に合わせて色が設定されており、選択した色の中間色を今のココロの色として表示します。
  [![Image from Gyazo](https://i.gyazo.com/f26964f7974bc4983a8b3ba2bfb8c9c7.gif)](https://gyazo.com/f26964f7974bc4983a8b3ba2bfb8c9c7)

    何についてのタスク投稿なのかを選択します。
  [![Image from Gyazo](https://i.gyazo.com/871a5e2f2ef4670385972d3050827bec.png)](https://gyazo.com/871a5e2f2ef4670385972d3050827bec)
  
    投稿完了です！
  [![Image from Gyazo](https://i.gyazo.com/26b99257d6ebc7ea7f1f8273f2e01dd2.png)](https://gyazo.com/26b99257d6ebc7ea7f1f8273f2e01dd2)

# アプリケーションを作成した背景
    社会人として働きながら資格の勉強をしていたとき、タスク管理アプリとジャーナリングアプリを併用していました。しかし、それぞれ別のアプリを使うのは手間がかかり、学習の進捗や日々の気持ちを一元管理できたらもっと便利なのにと思うことがありました。

    そこで、タスク管理とジャーナリングを組み合わせ、日々の感情の変化とタスクの達成を可視化できるアプリがあれば、より無理なく目標に向かえるのではないかと考え、『ココロタスク』を開発しました。

# 工夫したポイント
  ## 1, ポリモーフィック関連を採用
    『ココロタスク』では、Mood_Options（感情データのテーブル）をポリモーフィック関連として設計しました。
    なぜなら、ジャーナリング（Journal）とタスク（Task）に対して、共通のMood_Optionsを紐づけられるようにすることで、データの一貫性を保ちつつ、無駄なテーブルを増やさずに管理できるからです。
    また、将来的に『メモ（Memo）』や『プロジェクト（Project）』など新しい機能を追加し、新しいテーブルに感情データを持たせる必要ができた場合も、ポリモーフィック関連を活用することで柔軟に拡張できます。
  ## 2, 選択した色の中間色の表示
    ジャーナリングやタスク作成の際、その時の自身の感情を客観的に捉えることを目的に、選択した感情の色の中間色（平均色）を表示する機能を実装しました。
    ユーザーが選択した感情の色をHEXカラーコード（例：#FF4500）で保存し、平均色を求める際にRGB値に変換して計算する設計にしています。この仕組みにより、データの管理のしやすさと計算のしやすさを両立しました。
  ## ① HEXカラーコードをデータとして保存・管理
    シンプルな文字列で管理できるため、データの取り扱いがスムーズになります。
   - HEXカラーコード（#FF4500）は 7文字の文字列 で管理できるため、データベースに保存しやすい
   - HTMLやCSSでそのまま使えるため、フロントエンド側での処理がシンプルになる
  ## ② RGB値に変換して中間色を計算
    RGBはR,G,Bの数値で色を特定するため、変換色の計算をスムーズに処理できます。
   - HEXカラーコードのままでは計算が難しいため、一度 RGB値（赤・緑・青の数値）に変換する
   - 選択された複数の色をRGB値に変換し、各成分の平均を取ることで、中間色を求める
   - 最終的に求めたRGB値を、再びHEXカラーコードに変換して表示する

# データベース設計
  [![Image from Gyazo](https://i.gyazo.com/3584a91298cdf8e0170abaf84b9114ad.png)](https://gyazo.com/3584a91298cdf8e0170abaf84b9114ad)

# 画面遷移図
  [![Image from Gyazo](https://i.gyazo.com/54cd2eb35677ad7a0eb2f14ca2428b83.png)](https://gyazo.com/54cd2eb35677ad7a0eb2f14ca2428b83)

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