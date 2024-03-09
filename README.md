# README

## アプリ概要
railsでECサイトを作成しました。
目的としてDB設計やコントローラなどの設計を0から行いたかったこと、可読性や保守性の高いコードを学習するためです。設計する際にはRailsの生みの親である[DHH](https://postd.cc/how-dhh-organizes-his-rails-controllers/)が提案する
コントローラ設計を意識しました。具体的にはデフォルトのCRUDアクション index 、 show 、 new 、 edit 、 create 、 update 、 destroy のみを使うことを意識しました。もしそれ以外のアクションを使用したい場合は
新たにコントローラを作成することで、可読性の高いコードを意識しました。
また、ビューファイルにはロジックを書かずにロジックを書く場合にはデコレーターやヘルパー、モデルに書くことで、役割の分離を意識しました。


## 機能

- 商品一覧、詳細機能
- 商品管理機能
- カート機能実装
- チェックアウト機能実装
- プロモーションコード機能実装


## 改善点
- パフォーマンス改善<br>
  画像処理の箇所でActiveStorageでN+1が発生している点があるためです。
- 他の人のローカル環境でも動くように改善<br>
  画像を保存する際にローカル環境でもS3に接続しているため、ローカルに画像を保存するようにすることです。
- スタイル修正<br>
  バックエンドの学習がメインだったため、フロント側のスタイル修正がまだまだ荒い点があるためです。



## 前提

- dockerが必要です。

## setup

```
docker compose build
```

```
docker compose run --rm web bin/setup
```


```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000

## rubocop

```
docker compose run --rm web bundle exec rubocop -A
```

## htmlbeautifier

erbのフォーマッターです。

```
docker compose run --rm web bin/htmlbeautifier
```
