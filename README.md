# Reminder

## リポジトリの説明

- Ruby on Railsの学習用に作成した予定管理アプリです。

- 予定を登録すると開始15分前に、ユーザ登録時に設定したメールアドレスにリマインドメールが送信されます。

## アプリの概要

### 認証機能

メール認証をすることができます（deviseを利用）。

![default](https://user-images.githubusercontent.com/5575199/53341724-a7af6480-394f-11e9-9690-495373c2ea74.png)

### 予定管理機能

予定の登録、閲覧、削除ができます。

![1](https://user-images.githubusercontent.com/5575199/53341975-450a9880-3950-11e9-8d8f-e5e6c6ee0fbc.png)

カレンダーの日付を変更すると画面右側に表示される予定が、選択した日付のものに変わります（Ajaxを利用）。

![2](https://user-images.githubusercontent.com/5575199/53342034-72efdd00-3950-11e9-883f-173ecac3aff6.png)

### リマインド機能

登録した予定の開始15分前にリマインドメールを送信します。

![default](https://user-images.githubusercontent.com/5575199/53342087-8c912480-3950-11e9-941d-76f3a5dc40a9.png)

## 使用バージョン

- ruby 2.5.2p104 (2018-10-18 revision 65133)

- Rails 5.2.2

## セットアップ

### 1. リポジトリをクローンする

```
$ git clone https://github.com/mizuhara/reminder.git
```

### 2. ディレクトリを移動する

```
$ cd reminder/
```

### 3. ライブラリをインストールする

```
$ bundle install --path=vendor/bundle
```

### 4. 環境変数を設定する

reminder直下に ```.env``` ファイルを作成する。

```.env
TZ=Asia/Tokyo
GMAIL_ADDRESS=YOUR_GMAIL_ADDRESS
GMAIL_USERNAME=YOUR_GMAIL_USERNAME
GMAIL_PASSWORD=YOUR_GMAIL_PASSWORD
```

### 5. DBをマイグレーションする

```
$ bundle exec rake db:migrate
```

### 6. サーバを起動する

```
$ bundle exec rails s
```

### 7. workerを起動する

```
$ bundle exec rake jobs:work
```

### 8. アクセスする

ブラウザから http://localhost:3000 にアクセスする
