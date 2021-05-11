# 料研
[![CircleCI](https://circleci.com/gh/yu-corder/Ryoken.svg?style=svg)](https://app.circleci.com/pipelines/github/yu-corder)
<p>
    料理の投稿サイトです。<br>
    料理のレシピを共有できます。<br>
    気に入った投稿などを見つけていいねしておこう！
</p>
<p>
    <img width="1440" alt="スクリーンショット 2021-04-17 12 53 50" src="https://user-images.githubusercontent.com/77377366/115360990-1cfae500-a1fb-11eb-9536-e335b074a93f.png">
</p>
<p>
    <a href = "https://www.ryoken.tk">料研へ</a>
</p>

## 使用技術

* Ruby 2.6.3
* Ruby on Rails 6.0.3.4
* MySQL 5.7
* puma
* AWS
    * VPC
    * EC2
    * RDS
    * ALB
* Docker 20.10.2
* Docker-compose 1.27.4
* HTML CSS
* JavaScript

## AWS 構成図

![Untitled Diagram](https://user-images.githubusercontent.com/77377366/117814503-5923e180-b29f-11eb-8c1b-c790b8c6971d.png)

### CircleCi CI/CD

* Githubへのpush時に、Rspecを自動で実行
* Rspecが成功した場合、EC2への自動デプロイが実行

## 機能一覧

* ユーザー登録、ログイン機能(devise)
* 投稿機能
    * 複数画像投稿(CarrierWave)
* いいね機能(Ajax)
* ページネーション(kaminari)
* 検索機能(ransack)

## 今後の計画

* いいね機能だけではなくフォロー機能(Ajax), コメント機能(Ajax)の追加