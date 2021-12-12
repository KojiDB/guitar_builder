# テーブル設計

## Usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| address            | string  | null: false |
| post_number        | integer | null: false |
| phone_number       | integer |             |

### Association

-- has_many :comments

## Buildersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| brand_name         | string  | null: false |
| builder_email      | string  | null: false |
| encrypted_password | string  | null: false |
| area               | string  | null: false |
| city               | string  | null: false |
| introduction       | text    | null: false |
| price_zone         | string  | null: false |
| phone              | integer | null: false |
| private_order_id   | integer | null :false |

### Association

-- has_many :guitars
-- has_many :comments

## Guitarsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| guitar_name       | string     | null: false                    |
| guitar_type_id    | integer    | null: false                    |
| strings_number_id | integer    | null: false                    |
| price             | integer    | null: false                    |
| features          | text       | null: false                    |
| builder           | references | null: false, foreign_key: true |
| url               | text       |                                |

### Association

-- belongs_to :builder
-- has_many :comments

## Commentsテーブル

| Column  | Type       | Options                                      |
| ------- | ---------- | -------------------------------------------- |
| user    | references | null: false,unless:builder,foreign_key: true |
| builder | references | null: false,unless:user,foreign_key: true    |
| guitar  | references | null: false,foreign_key: true                |
| comment | text       | null: false                                  |

### Association

-- belongs_to :user
-- belongs_to :builder
-- belongs_to :guitar