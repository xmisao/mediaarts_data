# mediaarts_data

Scraped data of https://mediaarts-db.bunka.go.jp/

このリポジトリは文化庁「メディア芸術データベース（開発版）」のデータをスクレイピングした結果をプログラムで処理が容易なJSON形式に加工して公開するものです。完全なデータは [Releases](https://github.com/xmisao/mediaarts_data/releases) からダウンロードできます。サンプルのデータは [samples](https://github.com/xmisao/mediaarts_data/tree/master/samples) 以下に配置しています。

スクレイピングおよび加工には [mediaarts_scraper](https://github.com/xmisao/mediaarts_scraper) と、本リポジトリに含まれるスクレイピング用のプログラムを使用しています。

## Usage

```
bundle install
bundle exec rake -D
```

## Release procedure

```
git clone git@github.com:xmisao/mediaarts_data.git
cd mediaarts_data
bundle install
bundle exec rake scrape
bundle exec rake sample
git add -u
RELEASE_DATE=`date +%Y%m%d`
git commit -m "Release $RELEASE_DATE"
git tag -a $RELEASE_DATE -m $RELEASE_DATE
bundle exec rake package
git push origin master
git push origin $RELEASE_DATE
# Draft a new release and upload packages/mediaarts_data_$RELEASE_DATE.tgz with GitHub Website
```

## データについて

出典: 文化庁「メディア芸術データベース（開発版）」 https://mediaarts-db.bunka.go.jp/

このリポジトリで公開しているデータ(`data`および`samples`ディレクトリ以下の内容)は、文化庁「メディア芸術データベース（開発版）」を加工して作成しています。

## 利用規約

[文化庁「メディア芸術データベース（開発版）」の利用規約](https://mediaarts-db.bunka.go.jp/user_terms/)に準じます。
