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

## user テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
|encrypted_password| string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :items dependent: :destroy
- has_one :order dependent: :destroy
- belongs_to :card dependent: :destroy


## delivery_address テーブル

| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| destination_name | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| address1         | text       | null: false                    |
| address2         | text       |                                |
| tel_number       | string     | null: false                    |

### Association

- belongs_to :user


## card(pay.jp) テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |

### Association

- belongs_to :user


## item テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| price            | string     | null: false                    |
| condition        | string     | null: false                    |
| category_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :images dependent: :destroy
- belongs_to :category


## image テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| image       | string     | null: false                    |

### Association

- belongs_to :item


## category テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
|category_name| string     | null: false                    |

### Association

- has_many :item

<!-- ## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user -->
