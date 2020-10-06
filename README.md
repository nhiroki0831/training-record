# README

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
| gender_id          | integer    | null: false                    |
| birthday           | date       | null: false                    |
| tel                | string     | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| height             | integer    | null: false                    |
| job_id             | integer    | null: false                    |
| course_id          | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### customers-Association

- belongs_to :user
- has_many :trainings

## trainings テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| weight             | integer    | null: false                    |
| body_fat           | integer    | null: false                    |
| blood_pressure_max | integer    | null: false                    |
| blood_pressure_min | integer    | null: false                    |
| pulse              | integer    | null: false                    |
| training_count     | integer    | null: false                    |
| remarks            | text       |                                |
| customer           | references | null: false, foreign_key: true |

### trainings-Association

- belongs_to :customer