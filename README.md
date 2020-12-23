# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| nickname   | string | null: false               |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| birthday   | string | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type               | Options                        |
| ----------- | ------------------ | ------------------------------ |
| item_name   | string             | null: false                    |
| category    | string             | null: false                    |
| description | text               | null: false                    |
| condition   | text               | null: false                    |
| fee         | string             | null: false                    |
| area        | string             | null: false                    |
| days        | string             | null: false                    |
| prise       | string             | null: false                    |
| image       | ActiveStorageで実装 | null: false                    |
| user        | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| postal         | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | text       | null: false                    |
| phone          | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item