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
# コンテナ内でマイグレーション
rails db:migrate
```

`localhost:3000/`にブラウザでアクセスして下記のページが表示されたら完了
