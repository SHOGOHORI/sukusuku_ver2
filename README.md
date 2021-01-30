# ![home_logo](https://user-images.githubusercontent.com/69126475/104287280-934fc300-54f9-11eb-84eb-94f8f5635032.png)

## 更新履歴
ver.1：2020/10/20 → https://github.com/SHOGOHORI/myapp<br>
ver.2：2021/1/11

## ーSUKUSUKUーとは？
育児の悩み、不安を救うための育児特化型の相談アプリです。<br>
ママ、パパの不安を少しでも埋めたいという思いから、SNSに近い形の相談アプリを作成しました。<br>

__URL：__　https://www.sukusuku-app.com/

<img width="1252" alt="68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3638373038382f65383562363831362d333936332d393237382d336533382d3162353233613335643031622e706e67" src="https://user-images.githubusercontent.com/69126475/106260281-9372f100-6263-11eb-8264-41d9709c28c4.png">

## デモ
#### 相談機能
* __相談投稿__<br>
![相談](https://user-images.githubusercontent.com/69126475/106344583-ee512a80-62ed-11eb-9b36-86b8d66dc1f3.gif)

#### アンケート機能
* __投票__<br>
![アンケート](https://user-images.githubusercontent.com/69126475/106344578-e85b4980-62ed-11eb-8ade-1838de6c022d.gif)
## 使用技術

* __開発環境__
  * __Mac Catalina(10.15.7)__
  * __Docker 20.10.2 / docker-compose 1.27.4__

* __フロントエンド__
  * __jQuery 3.5.1__
  * __HTML / Sass / Bootstrap__

* __バックエンド__
  * __Ruby 2.7.2__
  * __Rails 6.0.3__

* __インフラ__
  * __CircleCI__
  * __Nginx 1.12.2__
  * __MySQL 8.0.22__
  * __AWS__ (VPC, EC2, ALB, ACM, S3, RDS, Route53, EIP, IAM)
  * __Capistrano3__

* その他使用ツール
  * Visual Studio Code
  * draw.io

## 機能
* __ユーザー登録関連__(devise)
  * 新規登録、プロフィール編集機能
  * 削除機能
  * ログイン、ログアウト機能
    * ログインした際、フレンドリーフォワーディングする
  * ゲストユーザーログイン機能

* __子どもの情報登録関連__
  * 新規登録、編集機能
  * 削除機能

* __相談投稿機能__
  * 一覧表示、記事詳細表示、投稿、画像アップロード、編集、
  * 投稿削除
  * コメント投稿、コメント返信
  * 受付終了機能

* __アンケート機能__
  * 一覧表示、記事詳細表示、投稿、画像アップロード、編集
  * 回答項目設定
  * 回答期限設定
  * コメント投稿


* __アンケート投票機能__
  * アンケート集計
  * 円グラフへ結果表示(chartkick)
  * 投票取り消し

* __記事ストック機能（Ajax対応）__
  * ストック数表示

* __閲覧数表示機能__

* __検索機能__(Ransack)
  * キーワード検索
  * タグ検索
  * 詳細検索（相談orアンケート、年齢の範囲検索、ソート）

* __ページネーション機能（Ajax対応）__(kaminari)

* __タグ切り替え機能__

* __Twitterシェア機能__

* __画像アップロード機能__ (carrierwave, AWS S3)

* __テスト機能__ (RSpec)
  * 単体テスト、統合テスト


## DB設計

### ER図
![68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3638373038382f38383162333362372d323765302d653432372d666162632d3164373430363961613239382e706e67](https://user-images.githubusercontent.com/69126475/106261242-a9cd7c80-6264-11eb-926e-dc904f3d6df3.png)

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

## インストール方法
```
$ git clone https://github.com/SHOGOHORI/sukusuku_ver2.git
$ cd sukusuku_ver2
$ docker-compose build
$ docker-compose up -d
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose run web rails db:seed
```
## 製作者
しょうご<br>
[twitter](https://twitter.com/shogo19881)

## ライセンス
[MIT](https://github.com/SHOGOHORI/sukusuku_ver2/blob/main/LICENSE)
