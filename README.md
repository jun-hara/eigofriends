### アプリ名:
Eigofriends

### 概要:
「フレンズ」を観ながら英語を勉強するをテーマにした英語学習サイトです。

### URL:
https://eigofriends.herokuapp.com/

### 使用技術
- Ruby 3.0.1
- Ruby on Rails 6.1.6
- PostgreSQL 14.5
- Puma
- Bootstrap
- jQuery

### 機能一覧
- ユーザー登録・ログイン機能
- パスワード暗号化(bcrypt)
- レッスン作成・編集(ActionText)
- コメント機能(ActionText)

### クラス図
![Screen Shot 2022-11-24 at 23 05 00](https://user-images.githubusercontent.com/26423484/203804421-ec353791-079e-4d12-961f-e15348ab4db3.png)


### 画面サンプル
#### レッスン一覧画面

![Screen Shot 2022-11-16 at 6 08 14](https://user-images.githubusercontent.com/26423484/202027479-9f99f368-bf09-4612-9b80-5d2b1fb014b2.png)

ログインしていない状態、または通常ユーザーは公開レッスンのみ閲覧可能です。

#### レッスン閲覧画面

![Screen Shot 2022-11-16 at 6 07 53](https://user-images.githubusercontent.com/26423484/202027807-f498c5cc-29ca-47c4-9fb1-9ad75a98d566.png)


#### レッスン一覧画面（管理者）

![Screen Shot 2022-11-16 at 5 57 22](https://user-images.githubusercontent.com/26423484/202027774-cb4a026f-b46c-49d8-86a9-89916c207c8f.png)

管理者は公開済レッスン及び未公開レッスンが閲覧可能です。鉛筆アイコンをクリックして編集画面へ遷移されます。


#### レッスン編集画面

![Screen Shot 2022-11-16 at 6 05 18](https://user-images.githubusercontent.com/26423484/202027836-02fc006a-34c4-434b-9acb-f6ed6071c82e.png)

レッスンのタイトル、セクションの追加及び編集ができます。
画面右側にレッスンのプレビューが見れます。

