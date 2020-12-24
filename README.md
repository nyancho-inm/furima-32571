# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| nickname             | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column       | Type               | Options                        |
| ------------ | ------------------ | ------------------------------ |
| item_name    | string             | null: false                    |
| description  | text               | null: false                    |
| category_id  | integer            | null: false                    |
| condition_id | integer            | null: false                    |
| fee_id       | integer            | null: false                    |
| area_id      | integer            | null: false                    |
| day_id       | integer            | null: false                    |
| price        | integer            | null: false                    |
| user         | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## Records テーブル

| Column      | Type               | Options                        |
| ----------- | ------------------ | ------------------------------ |
| user        | references         | null: false, foreign_key: true |
| item        | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| postal         | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
| record         | references | null: false, foreign_key: true |

### Association

- belongs_to :record
