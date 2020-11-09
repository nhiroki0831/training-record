# アプリ概要

## アプリ名 training-record
  URL:[http://54.199.94.212/](URL)

## 制作理由
  弟がパーソナルジムを経営しており、
  顧客のトレーニング履歴や健康状態をレコーディングするアプリを作成。
  トレーナー(ユーザー)視点の管理アプリですが、
  個人でも使用できるアプリに展開できると考えており、
  現在も機能を更新中になります。

## 主な機能一覧
*ユーザー(管理者)登録機能
*顧客登録機能
*顧客情報編集・削除機能
*顧客一覧編集機能
*顧客詳細表示機能
*トレーニング記録機能
*トレーニング情報編集・削除機能
*トレーニング履歴表示機能
*トレーニングコース残り回数カウント機能

## 使用方法

## E-R図

## 画面遷移図

## 追加予定機能

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