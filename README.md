# mediaarts_data

Scraped data of https://mediaarts-db.bunka.go.jp/

このリポジトリは文化庁「メディア芸術データベース（開発版）」のデータをスクレイピングした結果をプログラムで処理が容易なJSON形式に加工して公開するものです。完全なデータは [Releases](https://github.com/xmisao/mediaarts_data/releases) からダウンロードできます。サンプルのデータは [samples](https://github.com/xmisao/mediaarts_data/tree/master/samples) 以下に配置しています。

スクレイピングおよび加工には [mediaarts_scraper](https://github.com/xmisao/mediaarts_scraper) と、本リポジトリに含まれるスクレイピング用のプログラムを使用しています。

## Usage

```
bundle install
bundle exec rake -D
```

## データについて

出典: 文化庁「メディア芸術データベース（開発版）」 https://mediaarts-db.bunka.go.jp/

このリポジトリで公開しているデータ(`data`および`samples`ディレクトリ以下の内容)は、文化庁「メディア芸術データベース（開発版）」を加工して作成しています。

## 利用規約

[文化庁「メディア芸術データベース（開発版）」の利用規約](https://mediaarts-db.bunka.go.jp/user_terms/)に準じます。
