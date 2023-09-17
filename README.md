# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false,unique: true       |
|encrypted_password| string     | null: false                    |
| last_name        | string     | null: false                    |
| first_name       | string     | null: false                    |
| last_name_kana   | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birth_day        | date       | null: false                    |

### Association

- has_many :items dependent: :destroy
- has_one :address dependent: :destroy
- has_many :orders dependent: :destroy


## addresses テーブル

| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| destination_name | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| tel_number       | string     | null: false                    |

### Association

- belongs_to :user


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| delivery_charge  | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| shipping_time    | string     | null: false                    |
| price            | string     | null: false                    |

### Association

- belongs_to :user
- has_many :images dependent: :destroy
- has_one :order


## images テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| image       | string     | null: false                    |

### Association

- belongs_to :item


## orders テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| purchaser_user_id | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

<!-- ## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user -->
