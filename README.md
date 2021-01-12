# ![home_logo](https://user-images.githubusercontent.com/69126475/104287280-934fc300-54f9-11eb-84eb-94f8f5635032.png)

## 更新履歴
ver.1：2020/10/20 → https://childcare-questions-and-answer.herokuapp.com/<br>
ver.2：2021/1/11

## ーSUKUSUKUーとは？
育児の悩み、不安を救うための育児特化型の相談アプリです。<br>
長男が生まれた直後、妻の病気により一週間ほど一人で育児をしていました。<br>
孤独で不安だったその時の経験から、ママ、パパの不安を少しでも埋めたいという思いから、SNSに近い形の相談アプリを作成しました。<br>

__URL：__　https://www.sukusuku-app.com/

<img width="1438" alt="スクリーンショット 2021-01-12 12 10 44" src="https://user-images.githubusercontent.com/69126475/104273842-dfdbd400-54e2-11eb-9559-8293eba93b52.png">

## 使い方
## 使用技術

* __開発環境__
  * __Mac Catalina(10.15.7)__

* __フロントエンド__
  * __jQuery 3.5.1__
  * __HTML / Sass / Bootstrap__

* __バックエンド__
  * __Ruby 2.7.2__
  * __rails 6.0.3__

* __インフラ__
  * __CircleCI__
  * __Docker 20.10.2 / docker-compose 1.27.4__
  * __Nginx 1.12.2__
  * __MySQL 8.0.22__
  * __AWS__ (VPC, EC2, ALB, ACM, S3, RDS, Route53, EIP, IAM)
  * __Capistrano3__

* その他使用ツール
  * Visual Studio Code
  * draw.io

![サイトマップ](https://user-images.githubusercontent.com/69126475/104268336-03008680-54d7-11eb-814c-e92dd2cde1d3.png)
## 機能
* __ユーザー登録関連__(devise)
  * 新規登録、プロフィール編集機能
  * ログイン、ログアウト機能
  * ゲストユーザーログイン機能

* __子どもの情報登録関連__
  * 新規登録、編集機能

* __相談投稿機能__
  * 一覧表示、記事詳細表示、投稿、画像アップロード、編集、削除

  * コメント投稿

* __アンケート機能__
  * 回答期限設定

* __アンケート機能__

* __検索機能__(Ransack)
  * キーワード検索、タグ検索
  * 詳細検索

* ___ページネーション機能__(kaminari)

* __画像アップロード機能__ (carrierwave, AWS S3)

* __テスト機能__ (RSpec)
  * キーワード検索、タグ検索


## DB設計

### ER図
![ER図ver2](https://user-images.githubusercontent.com/69126475/104265584-46f08d00-54d1-11eb-9b0a-ba2b1eaf8f3b.png)
## 今後実装したい項目
