# README

## Overview

タスク管理 Rails アプリケーション。

## Requirement

- Docker Desktop 4.18.0

## Usage

リポジトリの取り込み

```
git clone git@github.com:8tako8tako8/rails-docker.git
cd rails-docker
```

セットアップと起動

```
docker-compose build
docker-compose up
```

データベースの作成

```
docker-compose run web rake db:create
```

```
# コンテナに入る
docker-compose exec web bash
# gemをインストール
> bundle install
# コンテナ内でマイグレーション
> rails db:migrate
```

`localhost:3000/`にブラウザでアクセスして下記のページが表示されたら完了

<img width="392" alt="スクリーンショット 2023-04-17 19 30 00" src="https://user-images.githubusercontent.com/65395999/232464023-a5cfd280-70af-43f2-99b8-8e44ea52bfdd.png">
