# music_concierge

## ローカルへのダウンロード方法

#### `Clone or Download` をクリック

<img src="https://user-images.githubusercontent.com/6190966/63349844-3baa3800-c397-11e9-8637-2b4feebc3266.png">

#### `git@github.com~` と記載された項目のバインダーみたいなアイコンをクリック

<img src="https://user-images.githubusercontent.com/6190966/63349848-41078280-c397-11e9-9865-eee8de1cc982.png">

アイコンクリックでリポジトリのダウンロード用URLがコピーされます

#### ターミナルでコピーした内容を貼り付け

```
-> % git@github.com:daimyo-college/music_concierge.git
```

`-> %` 部分はシェル（のテーマなど）によって異なります。
上記コマンドを実行するとリポジトリのダウンロードが始まりますので、予め作業用のディレクトリへ `cd` で移動しておいてください。

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
