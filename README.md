# ![home_logo](https://user-images.githubusercontent.com/69126475/104287280-934fc300-54f9-11eb-84eb-94f8f5635032.png)

## 更新履歴
ver.1：2020/10/20 → https://github.com/SHOGOHORI/myapp<br>
ver.2：2021/1/11

## ーSUKUSUKUーとは？
育児の悩み、不安を救うための育児特化型の相談アプリです。<br>
長男が生まれた直後、妻の病気により一週間ほど一人で育児をしていました。<br>
孤独で不安だったその時の経験から、ママ、パパの不安を少しでも埋めたいという思いから、SNSに近い形の相談アプリを作成しました。<br>

__URL：__　https://www.sukusuku-app.com/

<img width="1438" alt="スクリーンショット 2021-01-12 12 10 44" src="https://user-images.githubusercontent.com/69126475/104273842-dfdbd400-54e2-11eb-9559-8293eba93b52.png">

## デモ
#### 相談機能
* __相談投稿__<br>
![ezgif-3-cf11a0bdcdd4](https://user-images.githubusercontent.com/69126475/104345946-36c4c600-5542-11eb-987d-7275accd283a.gif)

* __コメント投稿__<br>
![ezgif-3-de68b7e5aa5a](https://user-images.githubusercontent.com/69126475/104346659-02053e80-5543-11eb-86f1-9d1b0c5b2e3e.gif)
#### アンケート機能
* __アンケート投稿__<br>
![ezgif-3-f4b7535e2558](https://user-images.githubusercontent.com/69126475/104348766-77720e80-5545-11eb-9e24-b1b7bf1dabb8.gif)
* __投票__<br>
![ezgif-4-1af7569f5bb7](https://user-images.githubusercontent.com/69126475/104315527-6feb3f00-551e-11eb-9c56-b5d7a79afab7.gif)
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
  * コメント投稿、コメント返信

* __アンケート機能__
  * 一覧表示、記事詳細表示、投稿、画像アップロード、編集、削除
  * コメント投稿、コメント返信
  * 回答期限設定

* __アンケート投票機能__

* __記事ストック機能（Ajax対応）__

* __検索機能__(Ransack)
  * キーワード検索、タグ検索
  * 詳細検索

* ___ページネーション機能__(kaminari)

* __画像アップロード機能__ (carrierwave, AWS S3)

* __テスト機能__ (RSpec)
  * 単体テスト、統合テスト


## DB設計

### ER図
![ER図ver2](https://user-images.githubusercontent.com/69126475/104393818-b2e1fc80-5588-11eb-96ee-952428a5de70.png)

### テーブル
| テーブル | 説明 |
|:--|:--|
| Users | ユーザー情報  |
| Children | 子どもの情報  |
| Consultations | 相談投稿の情報  |
| Consultation_comments | 相談対するコメント  |
| Consultation_comment_replys | 相談対するコメントの返信  |
| consultation_stocks | 相談のストック |
| Votes  | アンケート情報  |
| Vote_items | アンケートの選択肢  |
| Vote_relationships | アンケートの回答集計 |
| Vote_comments | アンケートに対するコメント |
| Vote_stocks | アンケートのストック |
| Categories | カテゴリー |

各テーブルのカラムについては[テーブル定義書](https://docs.google.com/spreadsheets/d/1TvVktXZPtrLlpxS2mJAdE3dkIZjo41ujKL53Q843fLY/edit?usp=sharing)を参照ください。
