# アプリ概要

## アプリ名 training-record
  URL:[http://54.199.94.212](http://54.199.94.212）
  開発ツール技術:HTML/CSS/Ruby/Ruby on Rails/JavaScript/GitHub/AWS(EC2/S3)
  <img width="1920" alt="training-record-index" src="https://user-images.githubusercontent.com/70359148/98643168-eda19b80-2371-11eb-860c-a3af19c7a63c.png">

## 制作理由
  家族がパーソナルジムを経営しており、  
  顧客のトレーニング履歴や健康状態をレコーディングするアプリを作成。  
  トレーナー(ユーザー)視点の管理アプリですが、  
  個人でも使用できるアプリに展開できると考えており、  
  現在も機能を更新中になります。

## 主な機能一覧
* ユーザー(管理者)登録機能
* 顧客登録機能
* 顧客情報編集・削除機能
* 顧客一覧編集機能
* 顧客詳細表示機能
* トレーニング記録機能
* トレーニング情報編集・削除機能
* トレーニング履歴表示機能
* トレーニングコース残り回数カウント機能
* 機能毎の単体テスト実施

## 使用方法
[training-record](http://54.199.94.212)にアクセス頂き
user:"admin"
pass:"2222"でトップページにアクセスできます。

トップページには顧客の情報が一覧として表示されており、  
新規登録、ログインを行う事で顧客登録、  トレーニング結果を記録できます。

左上の新規登録より新規登録画面に推移

必須情報を入力し、登録完了となります。  
トップページに戻るをクリックしトップページに遷移後、  
顧客登録をクリック、顧客登録画面に遷移します。  
必要な情報を入力し、登録をクリックすると登録が完了します。  
トップページに戻ると登録した顧客の一部情報が一覧に追加されます。  
該当の顧客情報の横に記録するのボタンがある為、  
クリックするとトレーニング記録画面に遷移します。  
必要な情報を入力し、記録するをクリックすると  トレーニングと健康状態の記録ができます。
トップページまたは、該当顧客の詳細ページに遷移できます。  
顧客詳細ページでは顧客の詳細ページに以降し、  トレーニング結果の履歴を確認でき、  
編集するをクリックすると編集画面へ、顧客情報、  トレーニング情報それぞれ削除するボタンを
クリックすると事で削除が可能となります。
記録、編集、削除機能は登録した管理のみが実行可能です。

## E-R図

## 画面遷移図

## 追加実装予定機能
* 結合テスト実施
* 顧客検索機能
* 顧客体重データ推移グラフ作成
* Docker、docker-compose導入
* CI/CDパイプライン構築


# テーブル設計(training-record)

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| password           | string     | null: false |


### users-Association

- has_many :customers


## customers テーブル

| Column             | Type       | Options                        |
| -------------      | ---------- | ------------------------------ |
| first_name         | string     | null: false                    |
| family_name        | string     | null: false                    |
| first-name_k       | string     | null: false                    |
| family_name_k      | string     | null: false                    |
| gender             | integer    | null: false                    |
| birthday           | date       | null: false                    |
| tel                | string     | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| job_id             | integer    | null: false                    |
| course_id          | integer    | null: false                    |
| height             | float      | null: false                    |
| user               | references | null: false, foreign_key: true |


### customers-Association

- belongs_to :user
- has_many :trainings

## trainings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| weight             | float      | null: false                    |
| body_fat           | float      | null: false                    |
| blood_pressure_max | integer    | null: false                    |
| blood_pressure_min | integer    | null: false                    |
| pulse              | integer    | null: false                    |
| part_a_id          | integer    | null: false                    |
| part_b_id          | integer    |                                |
| remarks            | text       |                                |
| customer           | references | null: false, foreign_key: true |

### trainings-Association

- belongs_to :customer