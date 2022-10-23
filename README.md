## README

## 概要

* オリジナルアプリで作成した画像投稿共有サービスアプリケーションです。（実装中）

## 開発状況

* 開 発 環 境：HTML/CSS/Ruby/Ruby on Rails/JavaScript/Github/MySQL
* 開 発 期 間：約2週間
* 平均作業時間：約8時間

## 本番環境

* URL https://tagtweet-38192.herokuapp.com/ (実装中)

* ID: admin
* Pass: 2222

* テスト用アカウント
* <投稿者用>
* メールアドレス: 
* パスワード: 
* <閲覧者用>
* メールアドレス: 
* パスワード: 

## 動作確認方法

* Chromeの最新版を利用してアクセスしてください。ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。

* 接続先およびログイン情報については、上記の通りです。なお、同時に複数の方がログインしている場合に、ログインできない可能性がございます。

* ★投稿方法は以下の手順で確認できます
* テストアカウントでログイン→トップページから新規投稿ボタン押下→新規投稿情報入力→新規投稿→他投稿者の閲覧、コメント可能

* ★閲覧方法は以下の手順で確認できます
* テストアカウントでログイン→トップページから投稿内容を選択→投稿内容を閲覧→コメント入力可能

* ★確認後、ログアウト処理をお願いします。

## 開発を通じて得られた知見

### 工夫した点

* １）
* ２）

### 苦労した点

* １）
* ２）

## 課題や今後実装したい機能

* ★今後実装したい機能は下記の機能となります。

* いいね機能
* フォロー機能
* 通知機能
* タグ機能
* 画像複数枚投稿機能
* SNSログイン機能
* AWSへデプロイ


## DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| name               | string              | null: false               |
| profile            | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false, unique: true |

### Association

* has_many :prototypes
* has_many :comments
* has_many :likes
* has_many :sns_credentials

## prototypes table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| title              | string              | null: false                    |
| place              | string              | null: false                    |
| tweet              | text                | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_many :comments
* has_many :likes

## comments table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| content           | text       | null: false                    |
| user              | references | null: false, foreign_key: true |
| prototype         | references | null: false, foreign_key: true |

### Association

* belongs_to :prototype
* belongs_to :user

## likes table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| user_id           | references | null: false, foreign_key: true |
| prototype_id      | references | null: false, foreign_key: true |

### Association

* belongs_to :prototype
* belongs_to :user

## sns_credentials table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| provider           | string              | null: false                    |
| uid                | string              | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

* belongs_to :user