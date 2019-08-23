# music_concierge

## ローカルへのダウンロード方法

#### `Clone or Download` をクリック

<img src="https://user-images.githubusercontent.com/6190966/63349844-3baa3800-c397-11e9-8637-2b4feebc3266.png">

#### `git@github.com~` と記載された項目のバインダーみたいなアイコンをクリック

<img src="https://user-images.githubusercontent.com/6190966/63349848-41078280-c397-11e9-9865-eee8de1cc982.png">

アイコンクリックでリポジトリのダウンロード用URLがコピーされます

#### ターミナルでコピーした内容を貼り付け

```
$ git@github.com:daimyo-college/music_concierge.git
```

## 起動方法

以下の環境変数を利用しています。 `rails s` の前に環境変数の指定が必要です。

```
ENV["CLIENT_ID"]="spotifyAPIのクライアントID"
ENV["CLIENT_SECRET"]="spotifyAPIのシークレットキー"
ENV["USER_NAME"]="Gmailのメールアドレス"
ENV["MAIL_PASSWORD"]="Gmailのアプリケーションパスワード"
```

#### spotifyAPIのクライアントIDとシークレットキーの取得方法

https://dev.classmethod.jp/etc/play-music-via-spotify-web-api/
あたりの手順を参考にしてください

#### Gmailのメールアドレス

各自お持ちのGmailのメールアドレスを入力してください

#### Gmailのアプリケーションパスワードの取得方法

https://railsguides.jp/action_mailer_basics.html#gmail%E7%94%A8%E3%81%AEaction-mailer%E8%A8%AD%E5%AE%9A
の
の手順を参考にしてください

#### 上記をすべて取得できたら、リポジトリをダウンロードしたディレクトリ内で以下のコマンドを実行

```
CLIENT_ID="spotifyAPIのクライアントID" CLIENT_SECRET="spotifyAPIのシークレットキー" USER_NAME="Gmailのメールアドレス" MAIL_PASSWORD="Gmailのアプリケーションパスワード" rails s
```

#### ブラウザで `http://localhost:3000/` にアクセス

## サイトの使い方

<img src="https://user-images.githubusercontent.com/6190966/63351265-e1f73d00-c399-11e9-9611-d25d4c6b525b.png">

<img src="https://user-images.githubusercontent.com/6190966/63351295-ec193b80-c399-11e9-8bc2-5b766d4ff958.png">

*注意*
送信元メールアドレスの変更はできません。 `USER_NAME="Gmailのメールアドレス"` で登録したメールアドレスがばっちり送信元に記載されますので、くれぐれも適当なメールアドレスを登録してメール送信せず、ご自身のメールアドレスでテストしてください。
