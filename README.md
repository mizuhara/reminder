# リポジトリの説明

- Ruby on Railsの学習用に作成した予定管理アプリです。

- 予定を登録すると開始15分前に、ユーザ登録時に設定したメールアドレスにリマインドメールが送信されます。

# 使用バージョン

- ruby 2.5.2p104 (2018-10-18 revision 65133)

- Rails 5.2.2

# セットアップ

## 1. リポジトリをクローンする

```
$ git clone https://MasayaMizuhara@bitbucket.org/MasayaMizuhara/reminder.git
```

## 2. ディレクトリを移動する

```
$ cd reminder/
```

## 3. ライブラリをインストールする

```
$ bundle install --path=vendor/bundle
```

## 4. 環境変数を設定する

reminder直下に ```.env``` ファイルを作成する。

```.env
TZ=Asia/Tokyo
GMAIL_ADDRESS=YOUR_GMAIL_ADDRESS
GMAIL_USERNAME=YOUR_GMAIL_USERNAME
GMAIL_PASSWORD=YOUR_GMAIL_PASSWORD
```

## 5. DBをマイグレーションする

```
$ bundle exec rake db:migrate
```

## 6. サーバを起動する

```
$ bundle exec rails s
```

## 7. workerを起動する

```
$ bundle exec rake jobs:work
```

## 8. アクセスする

ブラウザから http://localhost:3000 にアクセスする
